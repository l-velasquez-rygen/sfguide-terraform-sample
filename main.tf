terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.68"
    }
  }
}

provider "snowflake" {
  role = "RYGN_DT_LVELASQUEZ"
  private_key_passphrase = "RyGn_2023*"
}

data "snowflake_database" "existing_db" {
  name = "RYGN_DT_LVELASQUEZ_NOVA_ANALYTICS_CLONE"
}

resource "snowflake_schema" "schema" {
  database   = data.snowflake_database.existing_db.name
  name       = "TF_DEMO"
  is_managed = false
}

data "snowflake_role" "this" {
  name = "RYGN_DT_LVELASQUEZ"
}

output "role" {
  value = data.snowflake_role.this
}

output "database" {
  value = data.snowflake_database.existing_db
}