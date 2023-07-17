pip3 install gdown
gdown https://drive.google.com/uc?id=1TDOCNh2FoeaKMbR9Wc-1_MsOv-54a_IV
if [ ! $(which unzip) ]
then
    sudo apt-get install unzip
fi
unzip dataset.zip -d .
rm -rf dataset.zip