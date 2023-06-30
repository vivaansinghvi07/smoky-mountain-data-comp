@ECHO OFF
SET red=[31m
SET reset=[0m
SET green=[32m
IF EXIST .venv\ GOTO VENV_THERE
python3 -m venv .venv
:VENV_THERE
IF NOT EXIST .venv\Scripts GOTO WRONG_VENV
.venv\Scripts\activate
pip3 install -r requirements.txt
ECHO %red%Virtual Environment Entered.%reset%
GOTO EOF
:WRONG_VENV
echo %red%You have the wrong kind of venv. Try %green%venv.sh %red%instead.%reset%
:EOF