#!/bin/bash
# Устанавливаем путь к библиотекам
export LD_LIBRARY_PATH=/opt/jacket:$LD_LIBRARY_PATH
# Запускаем скрипт через python
python3 /opt/jacket/jacket.py
