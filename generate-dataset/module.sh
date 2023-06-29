: '
    This script clones the trdg repo, so it takes about 15 seconds more.
    This is for people that are not using a virtual environment.
    Or for those having problems with their own.
'


# make sure user is on main directory
if [ ! -f "README.md" ]
then
    cd ..
fi

if [ ! -f "README.md" ]
then
    echo "You must be in the main directory"
    exit
fi

# check to see if need to make example
if [ ! -d "examples" ] 
then
    mkdir examples
else
    rm -rf examples/*
fi

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
echo "*" > examples/.gitignore

# clear again
rm -rf TextRecognitionDataGenerator
rm -rf trdg