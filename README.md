# Power BI Log Analytics Starter Kit

<img src="https://images.squarespace-cdn.com/content/v1/57aa0fb1b3db2bbe2dfb5840/1607362034987-W2CCN0CV3112IH7MO9PP/ke17ZwdGBToddI8pDm48kHetbtA8IrNNARGRRAMq6VBZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVHhoieEUztzpJSjZ_qXSmFcXEpZNATOgXau2Y02sfc7AN1lH3P2bFZvTItROhWrBJ0/Power+BI+Logo.png" align="right"
     alt="Power BI Logo" width="120" height="178">

Power BI Log Analytics is a free tool that helps you fetch the right insigth of your Power BI usage. As a starter Kit, the main aim is to show you what kind of information you can get using the Power BI API's and how you can transform it to insights.

To do, i'm using the Power BI RESP API (`https://docs.microsoft.com/en-us/rest/api/power-bi/`) especially the ADMIN API.


 - Connect-PowerBIServiceAccount* : Log in the Power BI service (`https://docs.microsoft.com/en-us/powershell/module/microsoftpowerbimgmt.profile/connect-powerbiserviceaccount?view=powerbi-ps`) you need to install MicrosoftPowerBIMgmt Powershell module
 - Get Activity Events : Fetching the activity logs (`https://docs.microsoft.com/en-us/rest/api/power-bi/admin/getactivityevents`)
 - Groups GetGroupsAsAdmin : Returns a list of workspaces for the organization with enxtension of users,reports,dashboards,datasets,dataflows excluding the inactive and the personal workspaces (`https://docs.microsoft.com/en-us/rest/api/power-bi/admin/groups_getgroupsasadmin`)
 - Get Capacities As Admin : Returns a list of capacities for the organization. (`https://docs.microsoft.com/en-us/rest/api/power-bi/admin/getcapacitiesasadmin`)
 - Get Refreshables : Returns a list of refreshables for the organization (`https://docs.microsoft.com/en-us/rest/api/power-bi/admin/getrefreshables`)
 - Get Gateways : Returns a list of gateways for the organization (`No documentation for this V2.0 API`)
 - Datasets GetDatasourcesAsAdmin : Returns a list of datasources for the specified dataset. (`https://docs.microsoft.com/en-us/rest/api/power-bi/admin/datasets_getdatasourcesasadmin`)
 

Feel free to modify the script or the report to fit your needs.

# Prerequisites

* Power BI Administrator role
* Create the folder to be used in the  (`$BasePath`) to receive the files
* Update (`$BasePath`) the parameters setting of the report 
<a href="https://ibb.co/g4nHxSg"><img src="https://i.ibb.co/0sw8xCJ/Parameters.png" alt="Parameters" border="0"></a>
* Install (`MicrosoftPowerBIMgmt`) Powershell module to use the (`Connect-PowerBIServiceAccount`) API
* Data sources credential configuration : For this report, i'm using two datasources as you can see in my lineage diagrame.
    * Web : I'm using the url (`https://www.microsoft.com/en-us/download/details.aspx?id=53127`) using the Web connector to fetch the latest Gateway version and the published date, with anonymous credentials 
    * Data : The datasource to get acces to the files, with your own credentials
<a href="https://ibb.co/16SM8g4"><img src="https://i.ibb.co/WtT0ghR/Gateways-Settings.png" alt="Gateways-Settings" border="0"></a>
* Report developped with Power BI Desktop Version: 2.90.542.0 64-bit (February 2021)

# Limitations

* In the API call (`GetGroupsAsAdmin`) you must specify a limitation parametre of 5000 maximum (`$top={$top}`). If you have more than 5K Workspaces you'll be stuck ! In case you have several Premium capacity, then you can create a loop using each capacity as a filter. 
* The API call (`Refreshables`) will only fetch the data of the last refresh. In case your dataset refreshes several times, you'll only get the last status.
* There is an API (`Get Refresh History`) that allows you to get the history refresh, but you need to be part of each workspace.
* There is No API to extract the information about the APP at the organisation level.

# Versions
* 1.0.0 

# Documentations
     
### Activity
<a href="https://ibb.co/5BTpSXM"><img src="https://i.ibb.co/NZxDJgV/Activities.png" alt="Activities" border="0"></a>

- Activity by user : Number of action performed by a user
- Activity by Category : Number of action grouped by category
- Activity by Domain : Number of action grouped by domain performed by a user
- Activity by Capacity : Number of action grouped by capacity performed by a user
- Activity By Date : Number of action grouped by date performed by a user

### User Activities
<a href="https://ibb.co/1Yg6xBn"><img src="https://i.ibb.co/rKjsJqt/User-Activities.png" alt="User-Activities" border="0"></a>

- User per Workspace : Number of distinct user active in this workspace
- Activity per users : Number of action grouped by category performed by a user
- User by domain : Number of distinct user active by domain
- User by Capacity : Number of distinct user active by capacity
- User By Date : Number of distinct user active by date

### Activities details
<a href="https://ibb.co/p0D7Hw5"><img src="https://i.ibb.co/5MD0Q4w/Activity-Details.png" alt="Activity-Details" border="0"></a>

- Activity matrice details : breakdown details of all actions

### Inventory & Roles
<a href="https://ibb.co/FbS3Nz1"><img src="https://i.ibb.co/3yDdGcb/Inventory.png" alt="Inventory" border="0"></a>

- Inventory by Capacity, Worksapce, User & Access Right : Listing of Capacity, Workspace, user and access right for each one
- Users by Access Right repartition : Grouping Access Right per role
- Users by Capacity Name and Access Right : Grouping Access Right per Capacity

### Workspaces Details
<a href="https://ibb.co/9VdLY3z"><img src="https://i.ibb.co/hZTj81h/Inventory-Detail.png" alt="Inventory-Detail" border="0"></a>

- Inventory by Capacity, Worksapce, User & Access Right : Matrice breakdown
- Inventory by Capacity, Worksapce, User & Access Right : Neuronal graph

### Inventory Evolution
<a href="https://ibb.co/TghSr5d"><img src="https://i.ibb.co/QKmRXGt/Inventory-Evolution.png" alt="Inventory-Evolution" border="0"></a>

- Current Status : Current inventory status
- D-1 Status : Day -1 inventory status minus the current inventory
- Inventory History : Number of artefact by date 

### Refresh Schedule
<a href="https://ibb.co/DGRdwCy"><img src="https://i.ibb.co/0BG5YMS/Refreshables.png" alt="Refreshables" border="0"></a>

- Scheduled Refreshes Per User for a Week : Number of refreshes per user for a week
- Refreshes per Capacity : Number of refreshes per premium capacity for a week
- Refreshes per Dataset : Number of refreshes per dataset for a week
- Average Refreshes duration per dataset : Average refresh duration per dataset 
- Refreshes Schedule timeline : Timeline matrice of sheduled refreshes for a week
- Ratio Usage Activity / Number of Refresh per dataset : Ratio between usage and refresh for a dataset

### Refresh Status
<a href="https://ibb.co/qYjV4Ls"><img src="https://i.ibb.co/pjw5s6z/Refreshables-Status.png" alt="Refreshables-Status" border="0"></a>

- Refreshes by Capacity : last refreshe status per dataset
- Refresh Status timeline : Timeline status (Daily) for refreshes
- Refreshes Details : Matrice breakdown

### Gateways
<a href="https://ibb.co/Zc797b9"><img src="https://i.ibb.co/tYFRF1R/Gateways.png" alt="Gateways" border="0"></a>

- Latest Version : The latest verison available of the Data Gateway
- Date Pulished : Date of the availbility of the latest version of the Data Gateway
- Gateways Type : Repartition per gateway type
- Active Gateways : Repartion of active & inactive Gateways
- Customer Connector : Availabilty of customer connector 
- Uptodate version : Repartion of uptodate version gateways
- Gateways per user & per type : Number of distinct gateway per user & by type
- Gateways Version & Update Status : Number of distinct gateway version & Update Status

### Datasources
<a href="https://ibb.co/jvTMTQd"><img src="https://i.ibb.co/N6sjsJX/Datasources.png" alt="Datasources" border="0"></a>

- Datasources Type : Number of distinct type of datasources
- Datasources per user : Number of distinct datasources per user
- Datasources Details : Matrice breakdown

### Contact
For any suggestions or remarks, feel free to contact me on linkedIn  : https://www.linkedin.com/in/kasdalinassim/

;)