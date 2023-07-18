if [ ! $(which unzip) ]
then
    sudo apt-get install unzip
fi

if [ ! $(which gdown) ]
then
    pip3 install gdown
fi

if [ ! -d dataset ]
then
    gdown https://drive.google.com/uc?id=1TDOCNh2FoeaKMbR9Wc-1_MsOv-54a_IV
    unzip dataset.zip -d .
    rm -rf dataset.zip
fi

if [ ! -d step2/seg_from_SAM/images ]
then 
    gdown https://drive.google.com/uc?id=1iXYl_YlGeaA1Z12QBRgqDxgc4ZAGtsJ9
    unzip segmentations.zip -d .
    rm -rf segmentations.zip
fi

if [ ! -d step2/leaves ]
then 
    gdown https://drive.google.com/uc?id=1xPq1PzkvrDI89UWNkmOiJQpl9-Augl4M
    unzip leaves.zip -d .
    rm -rf leaves.zip
fi
