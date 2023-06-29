: '
    This script clones the trdg repo, so it takes about 15 seconds more.
    This is for people that are not using a virtual environment.
    Or for those having problems with their own.
'

# set up directory
rm -rf synthetic-data
mkdir synthetic-data synthetic-data/images 
echo '*' > synthetic-data/.gitignore

# clear existing directories
rm -rf trdg
rm -rf TextRecognitionDataGenerator

# clone repo to get editing access 
git clone https://github.com/Belval/TextRecognitionDataGenerator.git
mv TextRecognitionDataGenerator/trdg .

# run with moved font
rm -rf trdg/fonts/latin/*
cp image_font.ttf trdg/fonts/latin
python3 generate_dataset.py

# clear again
rm -rf TextRecognitionDataGenerator
rm -rf trdg