# Scripts
These are terminal scripts that will assist in the use of this code. Note: These scripts are NOT supported in Windows CMD or Powershell. If you are on a Windows device, it is suggested you use [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install). All scripts are written to be run in the home directory of the project (`smoky-mountain-data-comp/`).

## Startup Scripts

To download everything that will be used in the project, run `$ . scripts/startup.sh`. Run this if you are just starting out.

## Venv Scripts
`venv.sh` both run everything needed to set up the virtual environment for this project. You must be in the home directory of the project (`smoky-mountain-data-comp/`) and run `$ . scripts/venv.sh`.

## Loading Files
To load data and large image folders, run `$ ./scripts/load_files.sh`.

## Building Paper
The solution paper for this project is written in LaTeX. To build a PDF for the paper, simply run `$ ./scripts/build_paper.sh`.