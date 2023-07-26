#!/bin/bash

red=$(printf "\033[31m")
green=$(printf "\033[32m")
reset=$(printf "\033[0m")

# check if user on mac
if [ $(uname) == "Darwin" ]
then

    # lead user to the installer 
    if [ ! $(which port) ]
    then
        echo "You need to install MacPorts."
        exit
    fi

    # installs brew if needed
    if [ ! $(which brew) ]
    then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # install dependencies
    if [ ! $(which pdflatex) ]
    then
        brew install basictex
    fi

    # get things that may or may not be needed for template 
    sudo port install texlive-math-science
    sudo port install texlive-publishers

else 

    # install dependencies on Linux
    sudo apt-get update 
    sudo apt-get install texlive-latex-base
    sudo apt-get install texlive-math-science
    sudo apt-get install texlive-publishers

fi

# holds all files needed
cd paper

# run script to create the paper
pdflatex main
bibtex main
pdflatex main 
pdflatex main

# remove unneeded files
rm main.aux
rm main.log
rm main.spl
rm main.bbl
rm main.blg
rm main.out

# cd out of the paper dir
cd ..