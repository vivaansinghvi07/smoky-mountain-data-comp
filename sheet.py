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

def make_sheet(excel_file):
    wb = workbook()
    line = wb.active

    headers = ['filename', 'treatment', 'block', 'row', 'position', 'genotype']
    line.append(headers)

    for item in EXAMPLE_DATA:
        rows = [item['filename'], item['treatment'], item['block'], item['row'], item['position'], item['genotype']]
        line.append(rows)

    workbook.save(excel_file)
        
    
  
    


    
    



    # gets rows from varrun - assume the list of rows are in the format in EXAMPLE DATA

    # TODO: 
    # create a sheet and write each row of EXAMPLE_DATA in the sheet
    # save the sheet
    pass
