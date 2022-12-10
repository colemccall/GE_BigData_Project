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

Authors: Cole McCall, Gabe Murphy, Cody Lirazan

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
![image](https://user-images.githubusercontent.com/94725863/206819653-f61be6e5-56ce-46fe-a24f-8d3d6e36220c.png)


**SSIS Step 1) Backup Database Task**
- The first task in the ETL process is to backup everything that already exists in SQL Server
- As we are gathering, transforming, and loading new data, while unlikely, mistakes can be made and we need to have backups in place. The backups will be stored in the `Backups` directory, which is mentioned in more detail below


**SSIS Step 2) Data Wranglers**
- This set of tasks can be run in parallel, on both Canvas data and registrar data
- Essentially, these tasks go through the directory where spreadsheets are stored, join the spreadsheets together, and clean up the data
- These tasks use the `CanvasDataCleaner.py`, `RegistrarDataCleaner.py`, and `Wrangling.py` files, which are further described in the code section.
- Each task will result in a csv file of cleaned data, creating `Cleaned_Canvas_data.csv` and `Cleaned_Registar_Data.csv` located in `/Data/Staging/Cleaned`


**SSIS Step 3) Drop Existing Tables and Create New Tables in SQL**
- Because our data wranglers described in Step 2 concatenate all of the historical data, there is no need to keep the existing tables. This step deletes what is in SQL and creates a new empty table, which allows us to upload our cleaned data in Step 4.
- The queries needed to perform these tasks are located in `/Queries/Reset_Canvas_Tables.sql` and `/Queries/Reset_Registrar_Tables.sql`. Editing these files will edit the ETL process.
- NOTE: Future work could be done to determine which entries are already in SQL and only add the new ones. This would eliminate the need to drop tables and would be better for long-term use


**SSIS Step 4) Upload Cleaned .csv Files to SQL**
- This is a data flow task, which involves uploading .csv files into already created tables in SQL


**SSIS Step 5) Create Compliance Table**
- Now that Canvas data and registrar data is located in the Gen Ed database on a SQL Server, we can build a compliance table.
- We needed the canvas data and registrar data because courses where the professor did not assess the GE outcomes will not show up in the canvas data, requiring a join with the registrar data.
- The query that generates this compliance table is located in `/Queries/Compliance.sql`


### Backups
This directory contains a list of SQL Server database backup files. Everytime


### Code


### Dashboards


### Data


### Notebooks


### Queries


## Future Work
- Incorporate Qualtrics Data into the Data Pipeline, maybe applying NLP to the answers
- Setup up SSIS, SQL, and PowerBI on a school machine (or server), as these features can be automated but are currently on localhosts.








