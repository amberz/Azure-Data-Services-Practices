### migrate a ADF instance with particular resources to a new ADF instance


* Download PowerShell
[Install the Azure Az PowerShell module with PowerShellGet](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-6.2.0 )

* Connect to your Azure subscription
```
Connect-AzAccount
[Connect-AzAccount (Az.Accounts)}(https://docs.microsoft.com/en-us/powershell/module/az.accounts/connect-azaccount?view=azps-6.2.0)
```
* Choose the subscription if you have multiple subscriptions
```
Set-AzContext -Subscription "xxxx-xxxx-xxxx-xxxx"
[Set-AzContext (Az.Accounts)](https://docs.microsoft.com/en-us/powershell/module/az.accounts/set-azcontext?view=azps-6.2.0)
```

* Query current ADF instance
```
Get-AzDataFactoryV2 -ResourceGroupName "ADFRG"
```
[Get-AzDataFactoryV2](https://docs.microsoft.com/en-us/powershell/module/az.datafactory/get-azdatafactoryv2?view=azps-6.2.0)

* Migrate IR
Manually create IR 

* Migrate linked service
```
Set-AzDataFactoryV2LinkedService -ResourceGroupName "ADF" -DataFactoryName "WikiADF" -Name "LinkedServiceCuratedWikiData" -File "C:\\samples\\WikiSample\\LinkedServiceCuratedWikiData.json" | Format-List
```
    LinkedServiceName : LinkedServiceCuratedWikiData
    ResourceGroupName : ADF
    DataFactoryName   : WikiADF
    Properties        : Microsoft.Azure.Management.DataFactory.Models.AzureStorageLinkedService

    [Set-AzDataFactoryV2LinkedService](https://docs.microsoft.com/en-us/powershell/module/az.datafactory/set-azdatafactoryv2linkedservice?view=azps-6.2.0)

    
* Migrate Dataset and note create linked service, otherwise will get invalid reference
```
Set-AzDataFactoryV2Dataset -ResourceGroupName "ADF" -DataFactoryName "WikiADF" -Name "DAWikipediaClickEvents" -DefinitionFile "C:\\samples\\WikiSample\\DA_WikipediaClickEvents.json"
```
DatasetName       : DAWikipediaClickEvents
ResourceGroupName : ADF
DataFactoryName   : WikiADF
Structure         :
Properties        : Microsoft.Azure.Management.DataFactory.Models.AzureBlobDataset

[Set-AzDataFactoryV2Dataset](https://docs.microsoft.com/en-us/powershell/module/az.datafactory/set-azdatafactoryv2dataset?view=azps-6.2.0)
    
* Download pipeline .JSON file, and migrate a pipeline to current ADF instance to a new ADF instance
    ```
    Set-AzDataFactoryV2Pipeline -ResourceGroupName "ADF" -Name "PipelineName" -DataFactoryName "NewADFInstanceName" -File "C:\DPWikisample.json"
    ```
    PipelineName      : DPWikisample
    ResourceGroupName : ADF
    DataFactoryName   : WikiADF11
    Activities        : {MyCopyActivity_0_0, MyCopyActivity_1_0}
    Parameters        : {[OutputBlobName, Microsoft.Azure.Management.DataFactory.Models.ParameterSpecification]}


    [Set-AzDataFactoryV2Pipeline](https://docs.microsoft.com/en-us/powershell/module/az.datafactory/set-azdatafactoryv2pipeline?view=azps-6.2.0)
