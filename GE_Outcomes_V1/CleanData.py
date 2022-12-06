from Wrangling import loadDataFrame, cleanDataFrame, combineCanvas, combineRegistrar
import sys, os

if(len(sys.argv) == 1):
    ## This function combines the registrar data from each semester
    combineRegistrar()

    ## This function creates the combined canvas table, then returns the path for where it is saved
    input_path = combineCanvas()

    ## The output path will be in staging, in the cleaned folder
    output_path = 'C:\\Users\\colem\\Desktop\\Senior\\BigData\\GE_BigData_Project\\GE_Outcomes_V1\\2_Staging\\Cleaned\\Cleaned_Canvas_Data.csv'

    dataframe = loadDataFrame(input_path)
    newData, cleanData = cleanDataFrame(dataframe)

    cleanData.to_csv(output_path)

    print('Success')
else:
    print('Invalid batch')

