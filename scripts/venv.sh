: '
    For those running a venv in a Unix-based system.
'

red=$(printf "\033[31m")
reset=$(printf "\033[0m")

if [ ! -d ".venv" ]
then
    echo$red"No .venv found. Please create a virtual environment named .venv"$reset
    exit
fi
if [ ! -d ".venv/lib" ]
then
    echo$red"Incorrect .venv format. If you are running Windows Powershell or Command Prompt, use venv.bat"$reset
    exit
fi

if [ ! -d ".venv/lib/*/site-packages/trdg" ] 
then
    pip install trdg
fi

trdgpath=$(echo .venv/lib/*/site-packages/trdg)
fontpath=$trdgpath/fonts/latin

# setup folder
rm -rf synthetic-data
mkdir synthetic-data synthetic-data/images
echo '*' > synthetic-data/.gitignore

# create new images
cp -r $fontpath $trdgpath/fonts/latin-backup
rm $fontpath/*
cp image_font.ttf $fontpath/font.ttf
python3 generate_dataset.py
rm -r $fontpath
mv $trdgpath/fonts/latin-backup $fontpath