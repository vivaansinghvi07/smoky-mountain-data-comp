#!bin/bash

if [ ! $(which unzip) ]
then
    sudo apt-get install unzip
fi

if [ ! $(which gdown) ]
then
    pip3 install gdown
fi

if [ ! -d dataset ] || [ ! $(ls -1 dataset/ | wc -l) == 1672 ]
then
    rm -rf dataset/
    gdown https://drive.google.com/uc?id=1HxbrXHX9EJButzJu0up-jcLzmBTxIxRY
    unzip dataset.zip -d .
    rm -rf dataset.zip
fi

if [ ! -d step2/seg_from_SAM/images ] || [ ! $(ls -1 step2/seg_from_SAM/images | wc -l) == 1672 ]
then 
    rm -rf step2/seg_from_SAM/images/
    gdown https://drive.google.com/uc?id=1iXYl_YlGeaA1Z12QBRgqDxgc4ZAGtsJ9
    unzip segmentations.zip -d .
    rm -rf segmentations.zip
fi

if [ ! -d step2/leaves ] || [ ! $(ls -1 step2/leaves | wc -l) == 1663 ]
then 
    rm -rf step2/leaves
    gdown https://drive.google.com/uc?id=1xPq1PzkvrDI89UWNkmOiJQpl9-Augl4M
    unzip leaves.zip -d .
    rm -rf leaves.zip
fi
