#!/usr/bin/env python3
import sys
import os
import subprocess
import tempfile
import argparse
import requests
import json
import time
from pathlib import Path
from urllib.parse import quote

AUR_RPC_URL = "https://aur.archlinux.org/rpc/"
USER_AGENT = "aurix/0.5"
VERSION = "0.5"
CACHE_DIR = Path.home() / ".cache" / "aurix"
CACHE_TTL = 600

CACHE_DIR.mkdir(parents=True, exist_ok=True)

LOGO = r"""
          _    _ _____  _______   __
     /\  | |  | |  __ \|_   _\ \ / /
    /  \ | |  | | |__) | | |  \ V / 
   / /\ \| |  | |  _  /  | |   > <  
  / ____ \ |__| | | \ \ _| |_ / . \ 
 /_/    \_\____/|_|  \_\_____/_/ \_\
                                    
                                    
"""


def run_cmd(cmd, **kwargs):
    return subprocess.run(cmd, **kwargs)


def cache_key(name):
    return CACHE_DIR / f"{name}.json"


def load_cache(key):
    path = cache_key(key)
    if not path.exists():
        return None
    if time.time() - path.stat().st_mtime > CACHE_TTL:
        path.unlink()
        return None
    try:
        return json.loads(path.read_text())
    except:
        return None


def save_cache(key, data):
    cache_key(key).write_text(json.dumps(data))


def is_official_package(pkg_name):
    try:
        result = subprocess.run(
            ["pacman", "-Ss", f"^{pkg_name}$"],
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            text=True
        )
        if result.returncode != 0:
            return False
        for line in result.stdout.splitlines():
            repo = line.split("/")[0]
            if repo in ("core", "extra", "community", "multilib"):
                return True
        return False
    except Exception:
        return False


def install_official_packages(pkg_names):
    if not pkg_names:
        return
    print(f"Установка официальных пакетов: {', '.join(pkg_names)}")
    cmd = ["sudo", "pacman", "-S", "--needed", "--noconfirm"] + pkg_names
    try:
        run_cmd(cmd, check=True)
        print("✅ Официальные пакеты установлены.")
    except subprocess.CalledProcessError as e:
        print(f"❌ Ошибка установки официальных пакетов: {e}", file=sys.stderr)
        sys.exit(1)


def aur_search(query):
    key = f"search_{query}"
    cached = load_cache(key)
    if cached is not None:
        return cached

    url = f"{AUR_RPC_URL}?v=5&type=search&arg={quote(query)}"
    try:
        resp = requests.get(url, headers={"User-Agent": USER_AGENT}, timeout=10)
        resp.raise_for_status()
        results = resp.json().get("results", [])
        save_cache(key, results)
        return results
    except Exception as e:
        print(f"Ошибка поиска в AUR: {e}", file=sys.stderr)
        return []


def get_pkg_info(pkg_names):
    if not pkg_names:
        return []
    key = f"info_{'_'.join(sorted(pkg_names))}"
    cached = load_cache(key)
    if cached is not None:
        return cached

    args = "&".join([f"arg[]={quote(name)}" for name in pkg_names])
    url = f"{AUR_RPC_URL}?v=5&type=info&{args}"
    try:
        resp = requests.get(url, headers={"User-Agent": USER_AGENT}, timeout=10)
        resp.raise_for_status()
        results = resp.json().get("results", [])
        save_cache(key, results)
        return results
    except Exception as e:
        print(f"Ошибка получения информации о пакетах: {e}", file=sys.stderr)
        return []


def clone_pkgbuild(pkg_name, dest_dir):
    aur_url = f"https://aur.archlinux.org/{pkg_name}.git"
    try:
        run_cmd(["git", "clone", aur_url, dest_dir], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return True
    except subprocess.CalledProcessError:
        print(f"Не удалось клонировать: {aur_url}", file=sys.stderr)
        return False


def install_system_deps(depends):
    if not depends:
        return
    print("Установка системных зависимостей...")
    cmd = ["sudo", "pacman", "-S", "--needed", "--noconfirm"] + depends
    try:
        run_cmd(cmd, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Ошибка установки зависимостей: {e}", file=sys.stderr)


def build_and_install(pkg_dir):
    print("Сборка и установка пакета...")
    try:
        run_cmd(["makepkg", "-si", "--noconfirm", "--skippgpcheck"], cwd=pkg_dir, check=True)
        return True
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при сборке или установке: {e}", file=sys.stderr)
        return False


def install_aur_package(pkg_name):
    print(f"\n{'='*50}")
    print(f"Установка AUR-пакета: {pkg_name}")
    print(f"{'='*50}")

    results = aur_search(pkg_name)
    if not results:
        print(f"Пакет '{pkg_name}' не найден в AUR.", file=sys.stderr)
        sys.exit(1)

    pkg = next((p for p in results if p["Name"] == pkg_name), results[0])
    if pkg["Name"] != pkg_name:
        print(f"Точное совпадение не найдено. Выбран: {pkg['Name']}")

    print(f"Найден AUR-пакет: {pkg['Name']} (версия {pkg['Version']})")
    print(f"Описание: {pkg.get('Description', 'Нет описания')}")
    print(f"URL: https://aur.archlinux.org/packages/{pkg['Name']}\n")

    if input("Продолжить установку? [Y/n]: ").strip().lower() in ("n", "no"):
        print("Отмена.")
        sys.exit(0)

    full_info = get_pkg_info([pkg["Name"]])
    if not full_info:
        print("Не удалось получить информацию о пакете.", file=sys.stderr)
        sys.exit(1)

    with tempfile.TemporaryDirectory() as tmpdir:
        pkg_dir = os.path.join(tmpdir, pkg["Name"])
        if not clone_pkgbuild(pkg["Name"], pkg_dir):
            sys.exit(1)

        deps = full_info[0].get("Depends", [])
        install_system_deps(deps)

        if build_and_install(pkg_dir):
            print(f"✅ AUR-пакет '{pkg['Name']}' успешно установлен!")
        else:
            print("❌ Установка не удалась.", file=sys.stderr)
            sys.exit(1)


def uninstall_packages(pkg_names):
    if not pkg_names:
        print("Укажите пакеты для удаления.", file=sys.stderr)
        sys.exit(1)
    print(f"Удаление пакетов: {', '.join(pkg_names)}")
    cmd = ["sudo", "pacman", "-R", "--noconfirm"] + pkg_names
    try:
        run_cmd(cmd, check=True)
        print("✅ Пакеты удалены.")
    except subprocess.CalledProcessError as e:
        print(f"Ошибка удаления: {e}", file=sys.stderr)
        sys.exit(1)


def get_installed_aur_packages():
    try:
        result = run_cmd(["pacman", "-Qm"], capture_output=True, text=True, check=True)
        lines = result.stdout.strip().split("\n")
        if not lines or lines == ['']:
            return []
        return [line.split()[:2] for line in lines if len(line.split()) >= 2]
    except subprocess.CalledProcessError:
        return []


def update_aur_packages():
    print("🔄 Проверка обновлений для AUR-пакетов...")
    installed = get_installed_aur_packages()
    if not installed:
        print("Нет установленных AUR-пакетов.")
        return

    pkg_names = [name for name, _ in installed]
    aur_info = {pkg["Name"]: pkg for pkg in get_pkg_info(pkg_names)}

    outdated = []
    for name, local_ver in installed:
        remote = aur_info.get(name)
        if not remote:
            print(f"⚠️  Пакет {name} не найден в AUR (возможно, удалён)")
            continue
        if remote["Version"] != local_ver:
            outdated.append((name, local_ver, remote["Version"]))

    if not outdated:
        print("✅ Все AUR-пакеты актуальны.")
        return

    print(f"\nНайдено {len(outdated)} устаревших пакетов:\n")
    for name, local, remote in outdated:
        print(f"{name}: {local} → {remote}")

    if input("\nОбновить все? [Y/n]: ").strip().lower() in ("n", "no"):
        print("Отмена.")
        return

    for name, _, _ in outdated:
        install_aur_package(name)

    print("\n✅ Обновление AUR-пакетов завершено!")


def upgrade_system():
    print("🔄 Обновление официальных репозиториев...")
    try:
        run_cmd(["sudo", "pacman", "-Syu", "--noconfirm"], check=True)
    except subprocess.CalledProcessError as e:
        print(f"❌ Ошибка обновления системы: {e}", file=sys.stderr)
        sys.exit(1)

    print("\n🔄 Обновление AUR-пакетов...")
    update_aur_packages()
    print("\n✅ Полное обновление завершено!")


def install_packages(pkg_names):
    if not pkg_names:
        print("Укажите хотя бы один пакет для установки.", file=sys.stderr)
        sys.exit(1)

    official = []
    aur = []

    for pkg in pkg_names:
        if is_official_package(pkg):
            official.append(pkg)
        else:
            aur.append(pkg)

    if official:
        install_official_packages(official)
    if aur:
        for pkg in aur:
            install_aur_package(pkg)


def main():
    parser = argparse.ArgumentParser(
        prog="aurix",
        description="Универсальный хелпер для Arch Linux",
        add_help=False
    )
    parser.add_argument("command", nargs="?", help="Команда: install, uninstall, search, update, upgrade")
    parser.add_argument("args", nargs="*", help="Аргументы команды")
    parser.add_argument("-V", "--version", action="store_true", help="Показать версию")

    if len(sys.argv) == 1:
        print(LOGO)
        print("Использование: aurix <команда> [аргументы]")
        print("\nДоступные команды:")
        print("  install <пакет...>    Установить пакет(ы)")
        print("  uninstall <пакет...>  Удалить пакет(ы)")
        print("  search <запрос>       Поиск в AUR")
        print("  update                Обновить AUR-пакеты")
        print("  upgrade               Полное обновление системы")
        print("\nПримеры:")
        print("  aurix install neofetch visual-studio-code-bin")
        print("  aurix search firefox")
        print("  aurix upgrade")
        sys.exit(0)

    args = parser.parse_args()

    if args.version:
        print(f"aurix {VERSION}")
        sys.exit(0)

    command = args.command
    cmd_args = args.args

    if command == "install":
        install_packages(cmd_args)
    elif command == "uninstall":
        uninstall_packages(cmd_args)
    elif command == "search":
        if not cmd_args:
            print("Укажите запрос для поиска.", file=sys.stderr)
            sys.exit(1)
        results = aur_search(cmd_args[0])
        if not results:
            print("Ничего не найдено в AUR.")
        else:
            for pkg in results[:10]:
                print(f"{pkg['Name']} - {pkg.get('Version', 'unknown')}")
                desc = pkg.get('Description')
                if desc:
                    print(f"  {desc}")
                print()
    elif command == "update":
        update_aur_packages()
    elif command == "upgrade":
        upgrade_system()
    else:
        print(f"Неизвестная команда: {command}", file=sys.stderr)
        print("Доступные команды: install, uninstall, search, update, upgrade")
        sys.exit(1)


if __name__ == "__main__":
    main()