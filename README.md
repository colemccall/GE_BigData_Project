# NNU General Education Outcomes Big Data Management Project

This project was created in the Fall Semester of 2022 as part of the Advanced Database/Big Data Management Course at Northwest Nazarene University. 
This project intends to provide NNU's GE council with useful statistics, visualizations, and other information regarding the GE outcomes compliance status. 
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
- **Analyze qualtrics data to gather insight into GE outcomes process**
  - Acquire qualtrics data
  - Apply NLP

## Project Information

Authors: Cole McCall, Gabe Murphy, Cody Lirazan

Date: November 2022


## Project Requirements
- Python
- Jupyter
- Pandas

## Project Overview
This project can be divided into 5 categories:
1. Landing directory - Holds raw, untouched acquired data. **Acquire, import, do not touch.**
2. Staging directory - Holds data that has been wrangled. Missing values filled in, useless features removed.
3. Features directory - Holds reports/queries of the wrangled data. Valuable information from the data
4. Production directory - Location of PowerBi dashboards that display the reports.
5. Jupyter Notebooks (code) - Various scripts used to wrangle or extract features from the data.

## Project Details
- Run `GE_Data_Cleaning_Script.ipynb` to clean the input data
- Run `GE_Features_Script.ipynb` to query and create reports
- Launch PowerBi project `Test_10_28.pbix` located in `4_Production`
- View Dashboards

### Dashboards
**Dashboard 1: Overall University Compliance**
![image](https://user-images.githubusercontent.com/94725863/200230690-04aa14a6-6c08-4732-add3-dc3e12b7eec8.png)
NOTE: missing all entries where the outcome was not attached to an assignment

**Dashboard 2: Compliance by College**
![image](https://user-images.githubusercontent.com/94725863/200230966-d59d673e-32ba-4e59-84cc-47d28ae058ee.png)
NOTE: missing all entries where the outcome was not attached to an assignment


**Dashboard 3: Compliance by Course**
![image](https://user-images.githubusercontent.com/94725863/200231050-6cdf78a2-b79a-47d8-af11-80d3c21d81d6.png)
NOTE: missing all entries where the outcome was not attached to an assignment


**Dashboard 4: Outcomes by Course**
![image](https://user-images.githubusercontent.com/94725863/200231072-61f2c250-8f7c-497f-b712-e976eac78050.png)
NOTE: missing all entries where the outcome was not attached to an assignment







