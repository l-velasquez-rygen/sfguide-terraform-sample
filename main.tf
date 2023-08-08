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
}

data "snowflake_database" "existing_db" {
  name = "nova_analytics_uat_clone"
}

resource "snowflake_schema" "schema" {
  database   = data.snowflake_database.existing_db.name
  name       = "TF_DEMO"
  is_managed = false
}