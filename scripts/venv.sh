red=$(printf "\033[31m")
green=$(printf "\033[32m")
reset=$(printf "\033[0m")
if [ ! -d .venv ]
then
    python3 -m venv .venv
fi
if [ -f .venv/bin/activate ]
then
    source .venv/bin/activate
    pip3 install -r requirements.txt
    echo $red"Virtual Environment Entered."$reset
else
    echo $red"You have the wrong kind of venv. Try running "$green"venv.bat"$red" instead."$reset
fi