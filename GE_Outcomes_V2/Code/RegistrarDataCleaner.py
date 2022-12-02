from Wrangling import combineRegistrar, cleanRegistrar
import sys, os

if(len(sys.argv) == 1):
    ## This function combines the registrar data from each semester
    combineRegistrar()
    cleanRegistrar()
    ## Need to add check for colleges here
    ## Also need to change the file being used in SSIS VS

    print('Success')
else:
    print('Invalid batch')

