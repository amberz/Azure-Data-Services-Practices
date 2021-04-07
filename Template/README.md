# This template is for to quick build demo or test environment


## Deploy ARM Template to Azure 

 ```Azure PowerShell
New-AzResourceGroupDeployment -ResourceGroupName "<myResourceGroup>" -TemplateFile "<PATH TO purviewtemplate.json>" -TemplateParameterFile "<PATH TO test.parameters.json>"
 ```