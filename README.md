# Smoky Mountain Data Challenge

## Getting the Dataset

View the `load_files` scripts in the `scripts` directory to download the datasets.

Alternatively, visit the link [here](https://labkey.ornl.gov:8443/labkey/CBI/Martin/PUBLIC_DATA/Davis_Common_Garden_Genotypes/project-begin.view?) and download the folder. Then, unzip the download, move the folder to this repository, and rename it to 'dataset'.

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

For step 2:

    - Started with finding contours
        - Was very ineffective, as there was discrepancies in light and leaf color
    - Discuss the that I decided to use cv2's Canny algorith to partition leaves
        - Then, use a sort of 'inflation' technique using a kernel and dilation in cv2
    - This allowed for decent segmentation of the leaves
        - Then, discuss the ML model that I made that checks if leaves are good or not
            - Talk about how this ting was bad and not good at cropping out the images
        - Discuss how I decided to use Facebook Research's SAM on the approxdimations I found
            - Worked really well for getting leaves
                - Discuss the next ML model I made that determines if the leaf is valid for data analysis
    - @Langa this is where u come in
    
For step 3:

    - We were able to use OneHotEncoding in order to turn categorical data into numbers (discuss what that was and give a reference)
    - We also used the fact that level of brown splotch is rankable, so we converted it to a scale of 0-3
	- Then, we were able to plug our data into the model
		- Mention the fact that we also predicted classifications for each other thing in the model 

For step 4:

	- We could not use the EXIF data to approximate the length. This is for several reasons:
		- To determine the length, we needed the distance from the camera, which we did not have.
		- In order to determine distance, we needed the sensor size of the camera.
			- Because the camera was an iPhone 11, we could simply google the sensor size. However, this was not really accurate as we were still lacking some information.
		- We needed either or to get some answers, and we had neither.
		- If we had the focal plane resolution, we would be able to determine the length of a pixel. However, we did not have this.
		- The ResolutionX/Y tags were not useful either
		- We also could not measure relatively off the tags because they were often tilted
	- **About the next part**: One of you guys try to use an external dataset to show correlations
		- Since all the leaves were in the same place and we had no way to get the data, we cannot tell how differnet conditions would affect our thing.
		- **HOWEVER**, we can do research to still prove the question right. 


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

