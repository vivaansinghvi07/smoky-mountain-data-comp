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
examples_dir=$(pwd)"/examples"
git clone https://github.com/Belval/TextRecognitionDataGenerator.git
mv TextRecognitionDataGenerator/trdg .

# run with moved font
rm -rf trdg/fonts/latin/*
cp image_font.ttf trdg/fonts/latin
python3 generate_dataset.py $examples_dir
echo "*" > examples/.gitignore

# clear again
rm -rf TextRecognitionDataGenerator
rm -rf trdg