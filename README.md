# Power BI Log Analytics 

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

# Versions
* 1.0.1 : Adding new KPI in (`Refresh Schedule`) "Ratio Dataset Activity / Refreshs" giving you the balance between the usage of the dataset versus the refresh
* 1.0.0 : 

# Documentations
     
### Activity
<a href="https://ibb.co/5BTpSXM"><img src="https://i.ibb.co/NZxDJgV/Activities.png" alt="Activities" border="0"></a>

- Activity by user :
- Activity by Category : 
- Activity by Domain : 
- Activity by Capacity : 
- Activity By Date : 

### User Activities
<a href="https://ibb.co/1Yg6xBn"><img src="https://i.ibb.co/rKjsJqt/User-Activities.png" alt="User-Activities" border="0"></a>

- User per Workspace : 
- Activity per users
- User by domain : 
- User by Capacity : 
- User By Date : 

### Activities details
<a href="https://ibb.co/p0D7Hw5"><img src="https://i.ibb.co/5MD0Q4w/Activity-Details.png" alt="Activity-Details" border="0"></a>

- Activity matrice details : 

### Inventory & Roles
<a href="https://ibb.co/FbS3Nz1"><img src="https://i.ibb.co/3yDdGcb/Inventory.png" alt="Inventory" border="0"></a>

- Inventory by Capacity, Worksapce, User & Access Right : 
- Users by Access Right repartition : 
- Users by Capacity Name and Access Right : 

### Workspaces Details
<a href="https://ibb.co/9VdLY3z"><img src="https://i.ibb.co/hZTj81h/Inventory-Detail.png" alt="Inventory-Detail" border="0"></a>

- Inventory by Capacity, Worksapce, User & Access Right : 
- Inventory by Capacity, Worksapce, User & Access Right : 

### Inventory Evolution
<a href="https://ibb.co/TghSr5d"><img src="https://i.ibb.co/QKmRXGt/Inventory-Evolution.png" alt="Inventory-Evolution" border="0"></a>

- User per Workspace : 
- Activity per users
- User by domain : 
- User by Capacity : 
- User By Date : 

### Refresh Schedule
<a href="https://ibb.co/DGRdwCy"><img src="https://i.ibb.co/0BG5YMS/Refreshables.png" alt="Refreshables" border="0"></a>

- User per Workspace : 
- Activity per users
- User by domain : 
- User by Capacity : 
- User By Date : 

### Refresh Status
<a href="https://ibb.co/qYjV4Ls"><img src="https://i.ibb.co/pjw5s6z/Refreshables-Status.png" alt="Refreshables-Status" border="0"></a>

- User per Workspace : 
- Activity per users
- User by domain : 
- User by Capacity : 
- User By Date : 

### Gateways
<a href="https://ibb.co/4dLL7Q0"><img src="https://i.ibb.co/jRYYTpj/Gateways.png" alt="Gateways" border="0"></a>

- User per Workspace : 
- Activity per users
- User by domain : 
- User by Capacity : 
- User By Date : 

### Datasources
<a href="https://ibb.co/jvTMTQd"><img src="https://i.ibb.co/N6sjsJX/Datasources.png" alt="Datasources" border="0"></a>

- User per Workspace : 
- Activity per users
- User by domain : 
- User by Capacity : 
- User By Date : 
