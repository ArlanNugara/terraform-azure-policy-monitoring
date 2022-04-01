# Introduction

This is a monitoring and email alerting solution for Non-Compliant resources in Azure.

## Resources details

The list of resources created by this Bicep Project are as follows : -

- Log Analytics Workspace
- Event Grid Topic and Subscription
- App Service Plan
- Application Insights
- Storage Account
- Function App
- Azure Monitor Alert Rule

## Diagram

Here's a rough diagram of the resources it creates

![Diagram](./images/Diagram.png)

## Operations details

The **main.tf** creates the Resource Group and call each modules for creating the required resources. The **terraform.auto.tfvars** file contains variable values for all resources.