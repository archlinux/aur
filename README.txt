                        CMDFLOW

A colorful Fish command tracker with rainbow top visualization 🌈

cmdflow — это утилита для Linux, которая подсчитывает ваши команды Fish/Bash, создаёт топ-N команд и выводит его в терминал.

    Автокеширование команд при каждом запуске
    Поддержка старых и новых команд
    Топ-N с медалями и цветными барами
    Удобно для анализа вашей командной истории

🔹 Функционал

    Считает все введённые команды Fish и Bash, включая их повторы
    Берёт только первые аргументы команд (например, cargo build → cargo)
    Команды — радужная градиентная аллея
    Автоматически обновляет лог при каждом запуске

Пример вывода cmdflow --working 50:

🔹 Установка

Через GitHub:

git clone https://github.com/voideez/cmdflow.git
cd cmdflow/cmdflow
cargo build --release
mkdir -p ~/.local/bin
ln -sf "$(pwd)/target/release/cmdflow" ~/.local/bin/cmdflow

Теперь команда cmdflow доступна в любом терминале:

cmdflow          # top 10 (fish + bash)
--fish           # только fish
--bash           # только bash
cmdflow 15       # top 15 (fish + bash)
--fish 20        # top 20 (only fish)
--working        # only working commands
--broken         # only unworking commands

Через AUR:

Если установлен yay:

yay -S cmdflow

Будет собрана свежая версия проекта через Cargo.
🔹 Требования

    Rust + Cargo
    Fish shell
    Bash shell
    Linux-based distro

🔹 Разработка

Клонируем проект:

git clone https://github.com/voide/cmdflow.git
cd cmdflow/cmdflow

Сборка и запуск в режиме разработки:

cargo build
cargo run

После изменений можно обновить команду в терминале:

cargo build
ln -sf "$(pwd)/target/debug/cmdflow" ~/.local/bin/cmdflow
cmdflow 10