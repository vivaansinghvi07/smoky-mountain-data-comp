# SMC Data Challenge

Code for our submission to the SMC Data Challenge #1, machine-learning approaches to high-throughput phenotyping. View the solution paper [here](https://github.com/vivaansinghvi07/smoky-mountain-data-comp/blob/main/paper/main.pdf).

## Setup

If the repository is newly cloned, run `$ . scripts/startup.sh`. See more information about scripts in the `scripts/` folder [here](https://github.com/vivaansinghvi07/smoky-mountain-data-comp/tree/main/scripts). Note: all scripts can only be run on a Unix-based system, not Windows.

## Getting the Dataset

If you have run the `startup.sh` script, you do not need to download the dataset this way.

Visit the link [here](https://labkey.ornl.gov:8443/labkey/CBI/Martin/PUBLIC_DATA/Davis_Common_Garden_Genotypes/project-begin.view?) and download the folder. Then, unzip the download, move the folder to this repository, and rename it to 'dataset'.

## Requirements

This project works with Python 3.9/3.10 (not tested with Python versions lower than 3.9). To install dependencies, run `$ . scripts/venv.sh`.

## File Tree

This tree contains relevant information about the files in the project.

```c
smoky-mountain-data-comp
├─ LICENSE                  
├─ README.md
├─ adjust_sheets.py         // format all the sheets for each step to look nicer
├─ paper                    
│  ├─ images                    // contains images used in the paper
│  │  └─ ... 
│  ├─ main.bib                  // bibliography for paper
│  ├─ main.pdf                  // pdf of paper
│  └─ main.tex                  // paper in latex
├─ requirements.txt         // information about dependencies
├─ sample_dataset           // a sample of the images in the main dataset
│  └─ ...
├─ scripts                  // Unix shell scripts, helpful in project
│  ├─ README.md                
│  ├─ build_paper.sh            // compiles the paper with pdflatex
│  ├─ load_files.sh             // gets all large image folders needed for this code
│  ├─ startup.sh                // general startup script - does everything needed
│  └─ venv.sh                   // creates a virtual environment and installs dependencies
├─ step1                    
│  ├─ archive                   // contains old, unused code
│  │  ├─ generate_data.py           // was used to generate synthetic data for training OCR
│  │  └─ assets                     
│  │     └─ image_font.ttf              // the font used in the white label
│  ├─ data.xlsx                 // product of step 1
│  ├─ main.ipynb                // all code for solving the first step
│  ├─ ocr_test                  // testing possible OCR models
│  │  ├─ read_texts.csv             // stores texts read by each model
│  │  ├─ test_models.ipynb          // main notebook for testing and displaying the graphs
│  │  └─ timer.txt                  // stores times taken by each model
│  └─ pipeline                  // contains images showing the steps of the image augmentation pipeline
│     └─ ...
├─ step2
│  ├─ archive                   // contains old, unused code
│  │  ├─ model_from_contour.ipynb   // used to predict if a leaf was good or not from the contour itself 
│  │  └─ seg_from_contour           // files for the above model
│  │     ├─ data.csv                    // training data
│  │     ├─ model.pkl                   // model itself
│  │     └─ scaler.pkl                  // StandardScaler
│  ├─ data.xlsx                 // main spreadsheet after step 2 was finished
│  ├─ leaves                    // example cropped images of leaves generated later on in step 2
│  │  └─ ...
│  ├─ load_onnx_model.py        // loads the onnx model into the folder
│  ├─ main.ipynb                // main notebook for solving
│  ├─ model_from_masks.ipynb    // code for the model that filters segmented leaves based on leaf-ness
│  ├─ model_morph_class.ipynb   // code for the model that classifies leaf morphologies
│  ├─ morph_model               // stores files for morph classification model
│  │  ├─ data.csv                   // training data
│  │  ├─ encoders.pkl               // LabelEncoders for y-values
│  │  ├─ model.pkl                  // model itself
│  │  └─ scaler.pkl                 // StandardScaler
│  ├─ pipeline                  // contains images showing the steps of the image processing pipeline
│  │  └─ ...
│  └─ seg_from_SAM              // stores files for the segmentation filter model
│     ├─ data.csv                   // training data
│     ├─ images                     // example images of masks generated
│     │  └─ ...
│     ├─ model.pkl                  // model itself
│     └─ scaler.pkl                 // StandardScaler
├─ step3
│  ├─ data.xlsx                 // main spreadsheet after step 3 is done
│  ├─ main.ipynb                // all code required to run 
│  └─ model.pkl                 // model stored in a pickle file
└─ step4
   └─ main.ipynb                // all code required to run
```
© generated by [Project Tree Generator](https://woochanleee.github.io/project-tree-generator).

## Helpful Links

- [Competition Instructions](https://smc-datachallenge.ornl.gov/ch1_phenotyping/)
- [Data Link](https://labkey.ornl.gov:8443/labkey/CBI/Martin/PUBLIC_DATA/Davis_Common_Garden_Genotypes/project-begin.view?)

## License

This software is released under the MIT License.

## Contributors
- [Vivaan Singhvi](https://www.github.com/vivaansinghvi07)
- [Varrun Prakash](https://www.github.com/vman-lang)
- [Langa Lunga](https://www.github.com/Langali)
- [Chris Keum](https://www.github.com/chrisisbetter)
- [Pragya Nidhi](https://www.github.com/Pragya06Nidhi)
