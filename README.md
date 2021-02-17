# Power BI Log Analytics Starter Kit

<img src="https://images.squarespace-cdn.com/content/v1/57aa0fb1b3db2bbe2dfb5840/1607362034987-W2CCN0CV3112IH7MO9PP/ke17ZwdGBToddI8pDm48kHetbtA8IrNNARGRRAMq6VBZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVHhoieEUztzpJSjZ_qXSmFcXEpZNATOgXau2Y02sfc7AN1lH3P2bFZvTItROhWrBJ0/Power+BI+Logo.png" align="right"
     alt="Power BI Logo" width="120" height="178">

Power BI Log Analytics is a free tool, helping you to fetch the right insigth about your Power BI usage. This is a starter kit giving you a vision on what you can do and what
kind of data you can have.

As a starter Kit, the main aim is to show you what kind of information you can get using the Power BI API's and how you can transform theme to insights.

Feel free to modify the script or the report to fit your needs.

# Prerequisites

* PowerShell V7.0
* Power BI Administrator role

# Limitations

* The API call (`GetGroupsAsAdmin`) you must specicy a limitation parametre (`$top={$top}`) and the limitation is 5000. In case you have more than 5K Workspaces you'll be stuck ! in case you have several Premium capacity, then you can filter per capacity. So, lucky you are:).
* The API call (`Refreshables`) wil fetch only the data about the last refresh. In case your dataset refreshing several times per day, you'll get only the last status.
* There is an API (`Get Refresh History`) allows you to get the history refresh. But, you need to be part of each workspace.
* No API as admin to extract the information about the APP.

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
<a href="https://ibb.co/4dLL7Q0"><img src="https://i.ibb.co/jRYYTpj/Gateways.png" alt="Gateways" border="0"></a>

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
For any suggestions or remarks, do not hesitate to contact me via my linkedIn : https://www.linkedin.com/in/kasdalinassim/

;)

