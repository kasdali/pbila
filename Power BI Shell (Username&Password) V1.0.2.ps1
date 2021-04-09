cls


<#don't forget to install the shell module
Install-Module MicrosoftPowerBIMgmt.Admin
Install-Module MicrosoftPowerBIMgmt.Capacities
Install-Module MicrosoftPowerBIMgmt.Data
Install-Module MicrosoftPowerBIMgmt.Profile
Install-Module MicrosoftPowerBIMgmt.Rleports
Install-Module MicrosoftPowerBIMgmt.Workspaces
#>


# log into Azure AD user account with hard-code user name and password
Write-Host("Step 1 : Login....")
$User = "nakasdal@powerbichamps.net"
$PW = "K@sdo001137"


$SecPasswd = ConvertTo-SecureString $PW -AsPlainText -Force
$myCred = New-Object System.Management.Automation.PSCredential($User,$SecPasswd)

Connect-PowerBIServiceAccount -Credential $myCred

Write-Host("Step 1 : Login....Done")
#Loading Parametres

#Date Load
$x = -1
#
#While ($x -ne 0 )

#{
#$x++
$RetrieveDate = (Get-Date).AddDays($x)

$BasePath = "C:\Users\nakasdal\OneDrive - Microsoft\PBI Logs\Data\"
$time = date($RetrieveDate) -Format "yyyyMMdd"
$Filename = date($RetrieveDate) -Format "yyyyMMdd"

#Export Paths
$Groupspath      = $BasePath + $Filename+"_Workspaces.json"
$ActivityLogsPath = $BasePath + $Filename+"_Activities.csv"
$CapacitiesPath = $BasePath + $Filename+"_Capacities.json"
$RefreshablesPath = $BasePath + $Filename+"_Refreshables.json"
$GatewaysPath = $BasePath + $Filename+"_DataGateway.json"
$DatasourcesPath = $BasePath + $Filename+"_Datasources.json"


Write-Host("Step 2 : Loading Activities...."+$Filename)

$RetrieveYearStr = $RetrieveDate.ToString('yyyy')
$RetrieveMonthStr = $RetrieveDate.ToString('MM')
$RetrieveDayStr = $RetrieveDate.ToString('dd')

# set Startdate & Enddate
$StartDT = $RetrieveYearStr + '-' + $RetrieveMonthStr + '-' + $RetrieveDayStr + 'T00:00:00'
$EndDT = $RetrieveYearStr + '-' + $RetrieveMonthStr + '-' + $RetrieveDayStr + 'T23:59:59'


# Function to retrive power bi activities
$ActivityLogs = Get-PowerBIActivityEvent -StartDateTime $StartDt -EndDateTime $EndDT | ConvertFrom-Json
# retrive activities datas
$ActivityLogSchema = $ActivityLogs | `
    Select-Object Id,RecordType,CreationTime,Operation,OrganizationId,UserType,UserKey,Workload, `
        UserId,ClientIP,UserAgent,Activity,ItemName,WorkspaceName,DatasetName,ReportName, `
        WorkspaceId,CapacityId,CapacityName,DataflowId,DataflowName,DashboardName,AppName,ObjectId,DatasetId,ReportId,IsSuccess, `
        ReportType,RequestId,ActivityId,AppReportId,DistributionMethod,ConsumptionMethod, `
        @{Name="RetrieveDate";Expression={$RetrieveDate}}

# Exporting Activities Data
$ActivityLogSchema | Export-Csv $ActivityLogsPath 
Write-Host("Step 2 : Loading Activities....Done")
################## END ###########################################
#>


################## GET WORKSPACES DATA###########################################
Write-Host("Step 3 : Loading Groups...."+$Filename)
$GroupsURI = '/admin/groups?$top=5000&' + '$filter=type ne' + " 'PersonalGroup'" + ' and state eq' + " 'Active'" + '&$expand=users,reports,dashboards,datasets,dataflows'

$GroupsData = Invoke-PowerBIRestMethod -Url $GroupsURI -Method Get
# getting datasetid to be used in the datasource API
$DatasetId = $GroupsData.value.datasets.id
$GroupsData | out-File $Groupspath
Write-Host("Step 3 : Loading Groups....Done")
################## END ###########################################



################## GET CAPACITIES DATA###########################################
Write-Host("Step 4 : Loading Capacities....."+$Filename)
$CapacitiesURI = '/admin/capacities' 
Invoke-PowerBIRestMethod -Url $CapacitiesURI -Method Get | Out-File $CapacitiesPath
Write-Host("Step 4 : Loading Capacities.....Done")
################## END ###########################################



################## GET Refreshables DATA###########################################
Write-Host("Step 5 : Loading Refreshables....."+$Filename)
$RefreshablesURI = 'admin/capacities/refreshables?$expand=capacity,group'
Invoke-PowerBIRestMethod -Url $RefreshablesURI -Method Get | Out-File $RefreshablesPath
Write-Host("Step 5 : Loading Refreshables.....Done")
################## END ###########################################



################## GET Gateways DATA###########################################
Write-Host("Step 6:  Loading Gateways....."+$Filename)
$GatewaysURI = 'https://api.powerbi.com/v2.0/myorg/gatewayClusters?$expand=memberGateways'
Invoke-PowerBIRestMethod -Url $GatewaysURI -Method Get | Out-File $GatewaysPath
Write-Host("Step 6:  Loading Gateways.....Done")

#}

################## GET DataSource DATA###########################################
Write-Host("Step 7 : Loading Datasources....."+$Filename)
#Getting DatasetID
$GroupsURI = '/admin/groups?$top=5000&' + '$filter=type ne' + " 'PersonalGroup'" + ' and state eq' + " 'Active'" + '&$expand=datasets'

$GroupsData = Invoke-PowerBIRestMethod -Url $GroupsURI -Method Get | ConvertFrom-Json
# getting datasetid to be used in the datasource API
$DatasetId = $GroupsData.value.datasets.id

# i is used to count datasets
$i = 0 
$Obj_Store = @()

ForEach ($DatasetId in $DatasetId)
{
$DatasourceUri = "/admin/datasets/"+$DatasetId+"/datasources"
$DatasourceCall = Invoke-PowerBIRestMethod -Url $DatasourceUri -Method Get
#Information loop
$i++
Write-Host($i)
$DataCall = $DatasourceCall | ConvertFrom-Json | Foreach {
#store result into array to keep the json sructure
$Obj_Store += $_.value
}}
$Obj_Store | ConvertTo-Json | Out-File $DatasourcesPath -Append
Write-Host("Step 7 : Loading Datasources.....Done")




#Refresh dataset
Write-Host("Step 8 : Starting Refresh dataset.....")
$Dataset_Id = 'b28b4c3c-2535-4a71-af3e-20ef7f40a4c3'
$MailFailureNotify = @{"notifyOption"="MailOnFailure"}
$Refresh_URI= "https://api.powerbi.com/v1.0/myorg/datasets/"+$Dataset_Id+"/refreshes"
$RefreshCall = Invoke-PowerBIRestMethod -Url $Refresh_URI -Method Post -Body $MailFailureNotify
Write-Host("Step 8 : Starting Refresh dataset.....Done")


exit