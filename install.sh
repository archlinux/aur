#!/bin/bash

# Клонировать репозиторий
git clone https://github.com/yarchefis/wayscreen

# Создать целевую директорию, если её еще нет
mkdir -p download-wayscreen

# Переместить файлы из клонированного репозитория в целевую директорию
mv wayscreen/* download-wayscreen/

# Создать виртуальное окружение
python3 -m venv src/download-wayscreen
source download-wayscreen/bin/activate

# Установить зависимости
pip install pyinstaller pyscreenshot pillow

# Получить путь к pyinstaller
PYINSTALLER_PATH=$(which pyinstaller)

# Перейти в директорию с исходным кодом
cd src/download-wayscreen || exit

# Собрать исполняемый файл
"$PYINSTALLER_PATH" --onefile main.py

# Перейти в директорию с исполняемым файлом
cd dist || exit

# Переименовать исполняемый файл
mv main wayscreen

# Добавить права на выполнение
chmod +x wayscreen

# Скопировать исполняемый файл в /bin
if command -v sudo &> /dev/null; then
    sudo cp wayscreen /bin/
    echo "Программа успешно установлена! Больше интересных проектов на сайте https://yarchefis.ru"
    deactivate
    sudo rm -rf download-wayscreen
    sudo rm -rf wayscreen
elif command -v doas &> /dev/null; then
    doas cp wayscreen /bin/
    echo "Программа успешно установлена! Больше интересных проектов на сайте https://yarchefis.ru"
    deactivate
    doas rm -rf download-wayscreen
    doas rm -rf wayscreen
else
    echo "Произошла ошибка при установке программы в /bin. Убедитесь, что у вас есть sudo или doas"
fi
