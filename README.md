# Overview

This bicep code is developed to automate deployment of a Azure Non-Compliance resource monitoring solution. The solution is a split solution with bicep code creating the solution with the following sequence

1. Create all resources except Event Grid Topic and Subscription
2. Deploy the Azure Function (Manual or via AZ CLI / Azure Pipeline / VSCode)
3. Create the Event Grid Topic and Subscription

## Resources details

The list of resources created by this Bicep Project are as follows : -

- Log Analytics Workspace
- Event Grid Topic and Subscription
- Function App (Triggered Manually using AZ CLI or from VSCode)
- Azure Monitor Alert Rule
- Storage Account
- Azure Monitor Metrics
- Key Vault

## Diagram

Here's a rough diagram of the resources it creates

![Diagram](./images/policy-monitor-diagram.png)

## Understanding the Code

The provider config for backend. You need to replace "<Your Value here>" with your own values.

```
  backend "azurerm" {
    resource_group_name  = "<Your Value here>"
    storage_account_name = "<Your Value here>"
    container_name       = "<Your Value here>"
    key                  = "<Your Value here>"
  }
```

## Deploying the Function app

### Deploying using Azure DevOps Pipeline

Define the variable. Change the **functionAppName** as per your requirement

```
variables:
  functionWorkingDirectory: 'function'
  functionAppName: 'FN-PolicyMonitor'
```

Archive the function directory

```
- task: ArchiveFiles@2
    displayName: 'Archive Function directory'
    inputs:
    rootFolderOrFile: $(functionWorkingDirectory)
    includeRootFolder: false
    archiveType: zip
    archiveFile: $(Build.ArtifactStagingDirectory)/monitor.zip
    replaceExistingArchive: true
- publish: $(Build.ArtifactStagingDirectory)/monitor.zip
    artifact: drop
```

Deploy the Function App

```
- task: AzureFunctionApp@1
    displayName: 'Azure functions app deploy'
    inputs:
        appType: functionAppLinux
        appName: $(functionAppName)
        package: '$(Pipeline.Workspace)/drop/monitor.zip'
```
### Deploy using AZ cli

```
az functionapp deploy --resource-group <Reosurce group Name> --name <Function App Name> --src-path <Path to the zip file> --type zip
```

### Deploy using Powershell

```
$creds = Invoke-AzureRmResourceAction -ResourceGroupName <Reosurce group Name> -ResourceType Microsoft.Web/sites/config -ResourceName <App Name>/publishingcredentials -Action list -ApiVersion 2015-08-01 -Force

$username = $creds.Properties.PublishingUserName

$password = $creds.Properties.PublishingPassword

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username,$password)))

$apiUrl = "https://<yourFunctionApp>.scm.azurewebsites.net/api/zip/site/wwwroot"

$filePath = "<yourFunctionName>.zip"

Invoke-RestMethod -Uri $apiUrl -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -Method PUT -InFile $filePath -ContentType "multipart/form-data"
```

### Install Azure CLI

You can install Azure CLI from [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

### Authenticate Azure CLI

Hit the command **az login** from Comamnd Prompt or Terminal depending upon your OS. More details can be found [here](https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli)

### Trigger Manually

Fire the below command to create the resources using Bicep script

> terraform plan
> terraform apply