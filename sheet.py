# USE THIS OR ANOTHER LIBRARY FOR EXCELS
import openpyxl
from openpyxl import Workbook

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
    wb = Workbook()
    worksheet = wb.active
    
    # For writing the Header Rows on Excel
    headers = [*EXAMPLE_DATA[0].keys()]
    worksheet.append(headers)

    # For writing the data rows for each image in the dataset
    for item in EXAMPLE_DATA:
        rows = [item[header] for header in headers]
        worksheet.append(rows)

    wb.save(excel_file)
        
if __name__ == "__main__":
    make_sheet('a.xlsx')