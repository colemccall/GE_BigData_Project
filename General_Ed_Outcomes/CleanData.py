from Wrangling import loadDataFrame, cleanDataFrame, combineCanvas
import sys, os

if(len(sys.argv) == 1):
    ## This function creates the combined canvas table, then returns the path for where it is saved
    input_path = combineCanvas()
    print(input_path)

    ## The output path will be in staging, in the cleaned folder
    output_path = os.getcwd() + '\\2_Staging\\Cleaned\\Cleaned_Canvas_Data.csv'

    dataframe = loadDataFrame(input_path)
    newData, cleanData = cleanDataFrame(dataframe)

    cleanData.to_csv(output_path)

    print('Sucess')
else:
    print('Invalid batch')