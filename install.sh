#!/bin/bash

git clone https://github.com/yarchefis/wayscreen

mv wayscreen/* download-wayscreen/

python3 -m venv src/download-wayscreen
source download-wayscreen/bin/activate


pip install pyinstaller pyscreenshot pillow
PYINSTALLER_PATH=$(which pyinstaller)
cd src/download-wayscreen || exit
"$PYINSTALLER_PATH" --onefile main.py

cd dist || exit
mv main wayscreen
chmod +x wayscreen

if command -v sudo &> /dev/null; then
    sudo cp wayscreen /bin/
    echo "The program has been successfully installed! Thank you for choosing us, more cool projects on the website https://yarchefis.ru"
    deactivate
    sudo rm -rf download-wayscreen
    sudo rm -rf wayscreen
elif command -v doas &> /dev/null; then
    doas cp wayscreen /bin/
    echo "The program has been successfully installed! Thank you for choosing us, more cool projects on the website https://yarchefis.ru"
    deactivate
    doas rm -rf download-wayscreen
    doas rm -rf wayscreen
else
    echo "there was an error installing the program in /bin. Make sure you have sudo or doas"
fi