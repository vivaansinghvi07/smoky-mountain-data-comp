# Scripts
These are terminal scripts that will assist in the use of this code. All scripts are written to be run in the home directory of the project (`smoky-mountain-data-comp/`).

## Venv Scripts
`venv.sh` and `venv.bat` both run everything needed to set up the virtual environment for this project. You must be in the home directory of the project (the one with the `main.ipynb` file). To run them, follow these rules:
- If you are on a Unix-based system, run `venv.sh` using `$ . scripts/venv.sh`
- If you are on a Windows (Command Prompt or Powershell) system, run `$ .\scripts\venv.bat` 

## SAM Scripts
`SAM.sh` and `SAM.bat` are short scripts that install the Segment Anything Model (SAM) into the directory in which it is used (`step2`). To run, do the following:
- If on a Unix-based system, run `SAM.sh` using `$ sh scripts/SAM.sh`
- If on a Windows system, run `$ .\scripts\SAM.bat`
