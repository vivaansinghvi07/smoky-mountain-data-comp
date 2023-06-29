@ECHO OFF

:: SETS UP FOLDER
RMDIR /S /Q synthetic-data
MKDIR synthetic-data synthetic-data\images
ECHO '*' > synthetic-data\.gitignore

:: COPIES REPO AND FOLDERS
RMDIR /S /Q trdg TextRecognitionDataGenerator
git clone https://github.com/Belval/TextRecognitionDataGenerator.git
MOVE TextRecognitionDataGenerator\trdg .

:: RUN WITH MOVED FONT
DEL trdg\fonts\latin
COPY image_font.ttf trdg\fonts\latin\font.ttf
python3 generate_dataset.py

:: REMOVE AFTER DONE
RMDIR /S /Q trdg TextRecognitionDataGenerator
