######################################################################
# Customer account setup
######################################################################
variable "globalaccount" {
  type        = string
  description = "Defines the global account"
  default     = "yourglobalaccount"
}

variable "cli_server_url" {
  type        = string
  description = "Defines the CLI server URL"
  default     = "https://cli.btp.cloud.sap"
}

variable "cf_api_url" {
  type        = string
  description = "Defines the CLI server URL"
  default     = "https://api.cf.us10.hana.ondemand.com/"
}


# subaccount
variable "subaccount_name" {
  type        = string
  description = "The subaccount name."
  default     = "UC - Establish a Central Inbox with SAP Task Center"
}
variable "subaccount_id" {
  type        = string
  description = "The subaccount ID."
  default     = ""
}
# Region
variable "region" {
  type        = string
  description = "The region where the project account shall be created in."
  default     = "us10"
}
# Cloudfoundry environment label
variable "cf_environment_label" {
  type        = string
  description = "The Cloudfoundry environment label"
  default     = "cf-us10"
}

variable "subaccount_admins" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as subaccount administrators."
  default     = ["jane.doe@test.com", "john.doe@test.com"]
}

variable "subaccount_service_admins" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as subaccount service administrators."
  default     = ["jane.doe@test.com", "john.doe@test.com"]
}

variable "launchpad_admins" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as subaccount service administrators."
  default     = ["jane.doe@test.com", "john.doe@test.com"]
}

variable "custom_idp" {
  type        = string
  description = "Defines the custom IdP"
  default     = ""
}

variable "environment_label" {
  type        = string
  description = "In case there are multiple environments available for a subaccount, you can use this label to choose with which one you want to go. If nothing is given, we take by default the first available."
  default     = "cf-us10"
}

variable "cf_org_id" {
  type        = string
  description = "The Cloud Foundry Org ID from the Cloud Foundry environment instance."
}

variable "cf_org_name" {
  type        = string
  description = "Name of the Cloud Foundry org."
  default     = "mission-3774-sap-task-center"

  validation {
    condition     = can(regex("^.{1,255}$", var.cf_org_name))
    error_message = "The Cloud Foundry org name must not be emtpy and not exceed 255 characters."
  }
}

variable "cf_org_admins" {
  type        = list(string)
  description = "List of users to set as Cloudfoundry org administrators."

  # add validation to check if admins contains a list of valid email addresses
  validation {
    condition     = length([for email in var.cf_org_admins : can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", email))]) == length(var.cf_org_admins)
    error_message = "Please enter a valid email address for the CF Org admins."
  }
}

variable "cf_space_manager" {
  type        = list(string)
  description = "Defines the colleagues who are added to a CF space as space manager."

  # add validation to check if admins contains a list of valid email addresses
  validation {
    condition     = length([for email in var.cf_space_manager : can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", email))]) == length(var.cf_space_manager)
    error_message = "Please enter a valid email address for the CF space managers."
  }
}

variable "cf_space_developer" {
  type        = list(string)
  description = "Defines the colleagues who are added to a CF space as space developer."

  # add validation to check if admins contains a list of valid email addresses
  validation {
    condition     = length([for email in var.cf_space_developer : can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", email))]) == length(var.cf_space_developer)
    error_message = "Please enter a valid email address for the CF space developers."
  }
}

variable "service_plan__build_workzone" {
  type        = string
  description = "The plan for build_workzone subscription"
  default     = "free"
  validation {
    condition     = contains(["free", "standard"], var.service_plan__build_workzone)
    error_message = "Invalid value for service_plan__build_workzone. Only 'free' and 'standard' are allowed."
  }
}
