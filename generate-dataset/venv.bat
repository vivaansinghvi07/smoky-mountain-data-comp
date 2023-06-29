@ECHO OFF
SET red=[31m
SET reset=[0m

:: CHECKS FOR VALID FILES
IF NOT EXIST .venv GOTO NO_VENV
IF NOT EXIST .venv\Lib GOTO WRONG_VENV

:: ENTERS VENV IF NOT ALREADY
.venv\Scripts\activate

:: INSTALLS TRDG IF NEEDEED
IF EXIST .venv\Lib\site-packages\trdg GOTO TRDG_PRESENT
pip install trdg

:: MOVES TEXT AND RUNS THE SCRIPT
:TRDG_PRESENT
XCOPY /s /i /Q .venv\Lib\site-packages\trdg\fonts\latin .venv\Lib\site-packages\trdg\fonts\latin-backup
DEL /F /Q .venv\Lib\site-packages\trdg\fonts\latin
COPY image_font.ttf .venv\Lib\site-packages\trdg\fonts\latin\font.ttf
python3 generate_dataset.py
DEL .venv\Lib\site-packages\trdg\fonts\latin\font.ttf
RMDIR .venv\Lib\site-packages\trdg\fonts\latin
MOVE .venv\Lib\site-packages\trdg\fonts\latin-backup .venv\Lib\site-packages\trdg\fonts\latin
GOTO EOF

:: ERROR MESSAGES
:NO_VENV
ECHO %red%You must have a virtual environment named .venv%reset%
GOTO EOF
:WRONG_VENV
ECHO %red%Your virtual environment doesn't contain a Lib folder. Perhaps you have a Unix-type venv?%reset%
GOTO EOF

:: END OF SCRIPT MARKER
:EOF