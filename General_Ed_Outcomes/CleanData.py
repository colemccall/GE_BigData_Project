from Wrangling import loadDataFrame, cleanDataFrame
import sys

if(len(sys.argv) == 3):
    input_path = sys.argv[1]
    output_path = sys.argv[2]

    dataframe = loadDataFrame(input_path)
    newData, cleanData = cleanDataFrame(dataframe)

    cleanData.to_csv(output_path)

    print('Sucess')
else:
    print('Invalid batch')