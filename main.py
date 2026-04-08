import os
import sys
import shutil
import logging
from gui import VioletLauncherUI

# Настраиваем логирование, чтобы в терминале Arch Linux было видно, что происходит
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - [%(levelname)s] - %(message)s',
    handlers=[
        logging.FileHandler("launcher.log"),
        logging.StreamHandler(sys.stdout)
    ]
)


class VioletLauncherApp:
    def __init__(self):
        self.base_dir = os.path.expanduser("~/.violet_launcher")
        self.required_folders = ["mods", "runtime", "assets", "versions"]

    def prepare_environment(self):
        """Проверка и создание файловой структуры"""
        logging.info("Проверка окружения...")

        if not os.path.exists(self.base_dir):
            try:
                os.makedirs(self.base_dir)
                logging.info(f"Создана корневая папка: {self.base_dir}")
            except Exception as e:
                logging.error(f"Не удалось создать папку проекта: {e}")
                sys.exit(1)

        for folder in self.required_folders:
            path = os.path.join(self.base_dir, folder)
            if not os.path.exists(path):
                os.makedirs(path)
                logging.info(f"Создана директория: {folder}")

    def check_java(self):
        """Проверка наличия Java в системе Arch Linux"""
        logging.info("Проверка Java...")
        java_path = shutil.which("java")
        if java_path:
            logging.info(f"Java найдена: {java_path}")
            # Пытаемся получить версию
            return True
        else:
            logging.warning("Java не найдена! Установите через: sudo pacman -S jre-openjdk")
            return False

    def run(self):
        """Запуск основного цикла приложения"""
        try:
            logging.info("Инициализация интерфейса...")
            app = VioletLauncherUI()

            # Добавляем иконку (если есть файл icon.png в папке)
            # if os.path.exists("icon.png"):
            #    app.iconphoto(False, tk.PhotoImage(file='icon.png'))

            logging.info("Лаунчер успешно запущен.")
            app.mainloop()
        except Exception as e:
            logging.critical(f"Критическая ошибка при работе лаунчера: {e}")
        finally:
            logging.info("Сессия завершена.")


if __name__ == "__main__":
    # 1. Создаем экземпляр приложения
    launcher = VioletLauncherApp()

    # 2. Печатаем красивое приветствие в терминал
    print("-" * 30)
    print("   VIOLET LAUNCHER STARTING   ")
    print("      OS: ARCH LINUX          ")
    print("-" * 30)

    # 3. Подготовка
    launcher.prepare_environment()

    # 4. Проверка системных требований
    if not launcher.check_java():
        print("ВНИМАНИЕ: Java не обнаружена. Лаунчер может не запустить игру.")

    # 5. Старт GUI
    launcher.run()