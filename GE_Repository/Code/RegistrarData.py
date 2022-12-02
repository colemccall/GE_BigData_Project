from Wrangling import combineRegistrar
import sys, os

if(len(sys.argv) == 1):
    ## This function combines the registrar data from each semester
    combineRegistrar()

    print('Success')
else:
    print('Invalid batch')

