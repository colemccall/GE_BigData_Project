# NNU General Education Outcomes Big Data Management Project

This project was created in the Fall Semester of 2022 as part of the Advanced Database/Big Data Management Course at Northwest Nazarene University. 
This project intends to provide NNU's Gen Ed council with useful statistics, visualizations, and other information regarding the GE outcomes compliance status. 
Essentially, this project will aim to:
- **Use historical (Spring 2022) Canvas data to determine university compliance**
  - Scrape GE assignment data from Canvas
  - Clean/Wrangle Canvas outcome data
  - Generate reports based on the Canvas data
  - Visualize reports in PowerBi dashboards
- **Acquire and use current/future (Fall 2022) Canvas data to predict university compliance**
  - Scrape GE assignment data from Canvas
  - Determine which course sections have attached GE outcomes
  - Visualize reports (& potentially make predictions)

## Project Information

Authors: Cole McCall, Cody Lirazan, Gabe Murphy

Date: November 2022


## Project Requirements
- VS Code
  - Python
  - Jupyter
  - Pandas
  - Sci Kit Learn
  - Matplotlib
- Visual Studio 2019
  - SSIS
- SQL Server Management Studio
- PowerBI



## Project Overview
This project has been overhauled several times and now has a new format.
- GE_Outcomes_V0: This directory was created in the first weeks of the project, used simply for testing out different options. As a team, we explored using C#, Python, SQL, Jupyter, Hadoop, PowerBI, and more. This directory is not supported
- GE_Outcomes_V1: This directory was primarily used to clean data. In the process of cleaning the data, we realized more work was needed, which was completed in Version 2. THis directory is not very well supported
- GE_Outcomes_V2: This directory contains all of the current working code and projects. 

### Visual Studio Gen Ed SSIS Project
This directory contains a Visual Studio SSIS project file that is used Extract, Transform, and Load the data needed to perform NNU's Gen Ed compliance assessment. This image shows the layout of the SSIS project and each task is explained in more detail.
![image](https://user-images.githubusercontent.com/94725863/207447284-cad925bc-527f-4b69-bfe0-1201f1a62c0f.png)


**SSIS Step 1) Backup Database Task**
- The first task in the ETL process is to backup everything that already exists in SQL Server
- As we are gathering, transforming, and loading new data, while unlikely, mistakes can be made and we need to have backups in place. The backups will be stored in the `GE_Outcomes_V2/Backups` directory, which is mentioned in more detail below


**SSIS Step 2) Data Wranglers**
- This set of tasks can be run in parallel, on both Canvas data and registrar data
- Essentially, these tasks go through the directory where spreadsheets are stored, join the spreadsheets together, and clean up the data
- These tasks use the `CanvasDataCleaner.py`, `RegistrarDataCleaner.py`, and `Wrangling.py` files, which are further described in the code section.
- Each task will result in a csv file of cleaned data, creating `Cleaned_Canvas_data.csv` and `Cleaned_Registar_Data.csv` located in `/Data/Staging/Cleaned`


**SSIS Step 3) Drop Existing Tables and Create New Tables in SQL**
- Because our data wranglers described in Step 2 concatenate all of the historical data, there is no need to keep the existing tables. This step deletes what is in SQL and creates a new empty table, which allows us to upload our cleaned data in Step 4.
- The queries needed to perform these tasks are located in `GE_Outcomes_V2/Queries/Reset_Canvas_Tables.sql` and `GE_Outcomes_V2/Queries/Reset_Registrar_Tables.sql`. Editing these files will edit the ETL process.
- NOTE: Future work could be done to determine which entries are already in SQL and only add the new ones. This would eliminate the need to drop tables and would be better for long-term use


**SSIS Step 4) Upload Cleaned .csv Files to SQL**
- This is a data flow task, which involves uploading .csv files into already created tables in SQL


**SSIS Step 5) Create Compliance Table**
- Now that Canvas data and registrar data is located in the Gen Ed database on a SQL Server, we can build a compliance table.
- We needed the canvas data and registrar data because courses where the professor did not assess the GE outcomes will not show up in the canvas data, requiring a join with the registrar data.
- The query that generates this compliance table is located in `GE_Outcomes_V2/Queries/Compliance.sql`

**SSIS Step 6) Export Compliance Data**
- Even though we just uploaded data into SQL, we now need to export a copy of the joined table so that ML predictions can be made.
- This data will be saved as a .csv file to `GE_Outcomes_V2/Data/Compliance/GE_Compliance.csv`

**SSIS Step 7) Open PowerBI Dashboard and Machine Learning Notebook**
- The final step of this SSIS package actually opens up the PowerBI file that contains the dashboard, and opens the notebook needed to run machine learning.
- To open the dashboard, `GE_Outcomes_V2/Code/OpenPowerBI.bat` is used
- To open the ML notebook, `GE_Outcomes_V2/Code/OpenPredictionNotebook.bat` is used
- NOTE: This step will need to be changed to open the published dashboard instead of the current PowerBI file.


### Backups
This directory contains a list of SQL Server database backup files. Everytime the SSIS package is run - which can be setup to automatically run monthly, annually, etc - a backup of the existing tables in the database is made and saved.
Ideally, these backups could be saved to a shared drive or server, allowing us to ensure data integrity. Mistakes happen occassionally, and the damages can often be minimized by keeping backups.

The backups are located in `GE_Outcomes_V2/Backups` and can be imported into SQL server.


### Code
**COLE NEEDS TO ADD DESCRIPTION OF EACH FILE, WHEN TO USE THEM, HOW THEY ARE CALLED, AND WHAT THEY DO**
- Name:
  * Location:
  * Purpose:
  * Functions:
  * Use:
- Name:
  * Location:
  * Purpose:
  * Functions:
  * Use:
- Name:
  * Location:
  * Purpose:
  * Functions:
  * Use:




### Dashboards
This folder `GE_Outcomes_V2/Dashboards/` was created to save the dashboards created in PowerBI. Currently, there is only one dashboard, but users may want to save a copy after each semester. 


### Data
In the `GE_Outcomes_V2/Data/` directory, there are three primary folders.
- Folder 1) `GE_Outcomes_V2/Landing`
  * This folder has two subdirectories: Canvas and Registrar
  * Within each directory, there should all of the semesters of respective data that is intended to be included in the study. The scripts that have been written take all of the files within these folders and create one master file. For example, if the `GE_Outcomes_V2/Landing/Canvas` folder contains Canvas data from FA21, SP22, and FA22, one master file will be created that takes the contents of all three files combined.
  * To ensure this process is completed, any scraped data from the registrar or canvas should be placed directly in these folder
  * In the future, additional tasks can be added to the SSIS package (before Step 1) to scrape Canvas or the registrar and place the resulting data directly in the landing folder.

![image](https://user-images.githubusercontent.com/94725863/207451947-56f9d40f-5224-4b94-a693-4caec4fd6412.png)


- Folder 2) `GE_Outcomes_V2/Staging`
  * The staging folder contains two subdirectories, `Combined` and `Cleaned`. 
  * `Combined` holds the combined datasets, whereas `Cleaned` stores a modified version of each file that has undergone through cleaning and wrangling.

![image](https://user-images.githubusercontent.com/94725863/207451820-9c544fd0-c0f2-4b0e-b209-ed2350c4b824.png)


- Folder 3) `GE_Outcomes_V2/Compliance`
  * This folder is used to store the most recent compliance records
  * The file stored in this directory can only be obtained by exporting the compliance table from the GenEd database in SQL Server and is used as inputs for the machine learning predictions


### Notebooks
- Notebooks can be found in `GE_Outcomes_V2/Notebooks` and can be described as one of two types: Spiking notebooks or Machine Learning notebooks.
  * Machine Learning: The notebooks in this folder are used to perform compliance predictions via machine learning. Currently, there is only one notebook for machine learning, but any new or copied notebooks should be saved here.
  * Spiking: These notebooks were used to prototype functions and test out new ideas. Once the function was successfully created, it was saved as a function in one of the python modules located in `GE_Outcomes_V2/Code`. Most of these notebooks no longer run and were used in the beginning (spiking) phases of the project.

![image](https://user-images.githubusercontent.com/94725863/207452645-fd00105c-1eb3-40fb-baee-9248b27c7342.png)


### Queries
4 SQL Query Files are located in `GE_Outcomes_V2/Queries`
- `Compliance.sql`, responsible for joining the canvas and registrar tables together and determining which sections of a course were compliant. In addition, the created table stores the professors involved, the semester, the size of the course, and more.
- `Reset_Canvas_Tables.sql`, used in Step 3 of the SSIS ETL to drop the existing canvas tables and create new ones
- `Reset_Registrar_Tables.sql`, used in Step 3 of the SSIS ETL to drop the existing registrar tables and create new ones
- `Selections.sql`, used by our database team to design the queries used in PowerBI. While there is no actual connection with this file (unlike the other three whose file paths are included in the SSIS package), this file was helpful for testing out different methods of returning reports and determining the best way to present the relavant information.

## Future Work

**Data Sources**
- Incorporate Qualtrics Data into the Data Pipeline, maybe applying NLP to the answers

**Automation**
- Setup up SSIS, SQL, and PowerBI on a school machine (or server), as these features can be automated but are currently on localhosts.








