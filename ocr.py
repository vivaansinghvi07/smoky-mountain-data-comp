# ocr to spreadsheet
# import pytesseract
import openpyxl 
import os
import cv2
from easyocr import easyocr
from pathlib import Path

# pytesseract.pytesseract.tesseract_cmd = "C:\\Program Files\\Tesseract-OCR\\tesseract"

"""
read each image 

use image processing to make image clean

use ocr to get text from image

split the text into the features

write the features into a excel file

"""

ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
DATASET_PATH = f'{Path(__file__).parent}/dataset'
READER = easyocr.Reader(['en'])

def read_images():
    
    for (id, filename) in enumerate(os.listdir(DATASET_PATH)):
        image = cv2.imread(f"{DATASET_PATH}/{filename}")
        text = READER.readtext(image)
        print(text)

    return None

def create_sheet(sheet, id, *params) -> None:
    for (col_num, param) in enumerate(params):
        sheet[f"{ALPHABET.index(col_num)}{id}"] = param
    
def main():
    workbook = openpyxl.Workbook()
    sheet = workbook.active

if __name__ == "__main__":
    read_images()
    
    
    
