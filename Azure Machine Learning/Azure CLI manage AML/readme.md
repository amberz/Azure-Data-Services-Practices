In this tutorial will use VS Code

1. install Azure CL V2 in VS Cdoe
https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli
https://docs.microsoft.com/en-us/azure/machine-learning/how-to-setup-vs-code

NOTE: The new Machine Learning extension requires Azure CLI version >=2.15.0, check the Azure CLI Version
az version

2. Install ml extension
az login
az account set -s "subid"
az extension add -n ml -y


create AML workspace
az ml workspace create -n amberamlwscli -g AIMLRG -l westus2


