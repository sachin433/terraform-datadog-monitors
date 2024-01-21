provider "datadog" {
api_key = var.datadog_api_key
app_key = var.datadog_app_key
api_url = "https://api.us5.datadoghq.com/"
}

terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
      version = ">= 3.1.2"
    }
  }
  required_version = ">= 0.12.31"
#  experiments = [module_variable_optional_attrs]
  
  backend "s3" {
    bucket  = "datadog-state-bucket"
    key     = "datadog-monitoring-allenv.tfstate"
    region  = "us-west-2"
    encrypt = true
  }

}


