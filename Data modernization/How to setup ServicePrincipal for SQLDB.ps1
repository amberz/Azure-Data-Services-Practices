# PowerShell script for creating a new SQL user called myapp using application AppSP with secret
# https://docs.microsoft.com/en-us/azure/azure-sql/database/authentication-aad-service-principal-tutorial

$tenantId = "***"   #  tenantID (Azure Directory ID) were AppSP resides
$clientId = "***"   #  AppID also ClientID for AppSP     
$clientSecret = "***"   #  client secret for AppSP 
$Resource = "https://database.windows.net/"

#$adalPath  = "${env:Program Files}\WindowsPowerShell\Modules\AzureRM.profile\5.8.3"
# To install the latest AzureRM.profile version execute  Install-Module -Name AzureRM.profile
#$adal      = "$adalPath\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"
#$adalforms = "$adalPath\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll"
$adal="C:\Program Files\Microsoft SQL Server\150\DTS\Extensions\Common\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"
$adalforms="C:\Program Files\Microsoft SQL Server\150\DTS\Extensions\Common\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll"
[System.Reflection.Assembly]::LoadFrom($adal) | Out-Null
  $resourceAppIdURI = 'https://database.windows.net/'

  # Set Authority to Azure AD Tenant
  $authority = 'https://login.windows.net/' + $tenantId

  $ClientCred = [Microsoft.IdentityModel.Clients.ActiveDirectory.ClientCredential]::new($clientId, $clientSecret)
  $authContext = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext]::new($authority)
  $authResult = $authContext.AcquireTokenAsync($resourceAppIdURI,$ClientCred)
  $Tok = $authResult.Result.CreateAuthorizationHeader()
  $Tok=$Tok.Replace("Bearer ","")
  Write-host "token"
  $Tok
  Write-host  " "

$SQLServerName = "***"    # Azure SQL logical server name 
Write-Host "Create SQL connectionstring"
$conn = New-Object System.Data.SqlClient.SQLConnection 
$DatabaseName = "AdventureWorks2017"     # Azure SQL database name
$conn.ConnectionString = "Data Source=$SQLServerName.database.windows.net;Initial Catalog=$DatabaseName;Connect Timeout=30"
$conn.AccessToken = $Tok

Write-host "Connect to database and execute SQL script"
$conn.Open() 
$ddlstmt = 'select @@VERSION'
Write-host " "
Write-host "SQL DDL command"
$ddlstmt
$command = New-Object -TypeName System.Data.SqlClient.SqlCommand($ddlstmt, $conn)       

Write-host "results"
$command.ExecuteNonQuery()
$conn.Close()