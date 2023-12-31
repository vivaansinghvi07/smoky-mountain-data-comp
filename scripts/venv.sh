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
    echo '*' > .venv/.gitignore
    pip3 install -r requirements.txt
    if [ $(uname) = "Linux" ]
    then
        sudo apt-get update && sudo apt-get install libgl1 -y
    fi
    echo $red"Virtual Environment Entered."$reset
else
    echo $red"You have the wrong kind of venv. Try running "$green"venv.bat"$red" instead."$reset
fi