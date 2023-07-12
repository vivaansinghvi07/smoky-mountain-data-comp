# Smoky Mountain Data Challenge

## Getting the Dataset

Visit the link [here](https://labkey.ornl.gov:8443/labkey/CBI/Martin/PUBLIC_DATA/Davis_Common_Garden_Genotypes/project-begin.view?) and download the folder. Then, unzip the download, move the folder to this repository, and rename it to 'dataset'.

## Thoughts for Paper
For step 1: 

    - Discuss that the best OCR, among pytesseract, EasyOCR, KerasOCR, was PaddleOCR.
    - It was good because it tolerated rotated images as well
    - It read the characters reliably
    - ~10% images were not transcribed
    - Some discrepancies with the images caused some error
        - Finger in front of the label - led to less treatments being read
        - Leaves in front
        - Labels were skewed
    - Show sample of spreadsheet
    - Discuss method
        - Image read -> color converted -> read -> regexed -> spreadsheet

## Requirements

Works best with Python Version 3.9. To install dependencies, see the Virtual Environments section of the `README.md` file in `scripts` directory.

## Contributors
- [Vivaan Singhvi](https://www.github.com/vivaansinghvi07)
- [Varrun Prakash](https://www.github.com/vman-lang)
- [Langa Lunga](https://www.github.com/Langali)
- [Chris Keum](https://www.github.com/chrisisbetter)
- [Pragya Nidhi](https://www.github.com/Pragya06Nidhi)

## Helpful Links

- [Competition Instructions](https://smc-datachallenge.ornl.gov/ch1_phenotyping/)
- [Data Link](https://labkey.ornl.gov:8443/labkey/CBI/Martin/PUBLIC_DATA/Davis_Common_Garden_Genotypes/project-begin.view?)
- [Reference for Leaf Seperation](https://github.com/julzerinos/python-opencv-leaf-detection/blob/master/PlantDetector.py)
- [Segmentation with Tensorflow](https://www.tensorflow.org/tutorials/images/segmentation)

## Instructions / TODO
    - Everyone: Work on step 2

## Step 1 Process
    - Process the image to make it easiest to proces text (cropping, etc)
    - Plug those into a neural network to get the text
    - Get the text and process the text to make it match
    - Plug the text into the spreadsheet

## Notes
    - Vivaan:
        - [Synthetic data generation](https://github.com/Belval/TextRecognitionDataGenerator)
        - Font used in the labels was matched to be Sequel Sans Headline Medium
        - Create some images with varying background noises

