# USE THIS OR ANOTHER LIBRARY FOR EXCELS
import openpyxl

"""  treatment, block, row,  position, and genotype """

EXAMPLE_DATA = [
    {
        'filename': 'example1.png', 
        'treatment': 'C', 
        'block': '1', 
        'row': '54', 
        'position': '12', 
        'genotype': 'BESC-4590_LM'
    },
    {
        'filename': 'example2.png', 
        'treatment': 'D', 
        'block': '2', 
        'row': '23', 
        'position': '10', 
        'genotype': 'BESC-4230_LM'
    }
]

def make_sheet():
    # gets rows from varrun - assume the list of rows are in the format in EXAMPLE DATA

    # TODO: 
    # create a sheet and write each row of EXAMPLE_DATA in the sheet
    # save the sheet
    pass