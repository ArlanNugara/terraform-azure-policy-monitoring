// Create the Azure Monitor Alert Group
resource "azurerm_monitor_action_group" "mag" {
  name                = var.mag_name
  resource_group_name = var.module_rg_name
  short_name          = var.mag_short_name
  tags                = var.tags
  email_receiver {
    name                    = var.mag_receiver_name
    email_address           = var.mag_receiver_email
    use_common_alert_schema = true
  }
}

// Create the Azure Monitor Alert
resource "azurerm_monitor_scheduled_query_rules_alert" "alert" {
  name                = var.alert_name
  location            = var.module_rg_location
  resource_group_name = var.module_rg_name
  action {
    action_group  = [azurerm_monitor_action_group.mag.id]
    email_subject = "Policy Compliance Alert"
  }
  data_source_id = var.module_ai_id
  description    = "Alert when total results cross threshold"
  enabled        = true
  query          = <<-QUERY
  PolicyInsights_CL
    | where event_type_s =~ "Microsoft.PolicyInsights.PolicyStateCreated" or event_type_s =~ "Microsoft.PolicyInsights.PolicyStateChanged"
    | where data_complianceState_s =~ "NonCompliant"
    | extend Time_Stamp=data_timestamp_t
    | extend Resource_Id = subject_s
    | extend Subscription_Id = data_subscriptionId_g
    | extend Compliance_state = data_complianceState_s
    | extend Policy_Definition = data_policyDefinitionId_s
    | extend Policy_Assignment = data_policyAssignmentId_s
    | extend Compliance_Reason_Code = data_complianceReasonCode_s
    | project Time_Stamp, Resource_Id, Subscription_Id, Policy_Assignment, Policy_Definition, Compliance_state, Compliance_Reason_Code
  QUERY
  severity       = 3
  frequency      = 5
  time_window    = 30
  trigger {
    operator  = "GreaterThanOrEqual"
    threshold = 0
  }
}