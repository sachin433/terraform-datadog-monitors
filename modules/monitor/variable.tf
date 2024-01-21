variable "dd_properties" {
  type = list(object({
    name = string
    alert_type = string
    alert_message = string
    alert_query = string
    alert_warning = optional (number)
    alert_critical = number
    alert_critical_recovery = optional (number)
    alert_warning_recovery = optional (number)
    ddpriority = optional (number)
    timeout_h = optional ( number ) 
    new_group_delay = optional (number)
    
   
 

  }))
}



variable "env" {
  type = string
} 


variable "datadog_app_key" {
  description = "API key for Datadog Auth"
  type        = string
}
variable "datadog_api_key" {
  description = "APP key for Datadog Auth"
  type        = string
}




