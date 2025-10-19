#!/usr/bin/env python3
import sys
import os
import json
import subprocess
import tempfile
import argparse
from urllib.parse import quote
import requests

# Конфигурация
AUR_RPC_URL = "https://aur.archlinux.org/rpc/"
USER_AGENT = "aurix/0.1"
VERSION = "0.1"

# ASCII-логотип (опционально)
LOGO = r"""
   ___    __
  / _ |  / /_   __ _   ___
 / __ | / __/  /  ' \ / -_)
/_/ |_| \__/  /_/_/_/ \__/

aurix v""" + VERSION + """ — простой AUR-хелпер на Python
"""


def aur_search(query):
    """Ищет пакеты в AUR по запросу."""
    url = f"{AUR_RPC_URL}?v=5&type=search&arg={quote(query)}"
    headers = {"User-Agent": USER_AGENT}
    try:
        resp = requests.get(url, headers=headers, timeout=10)
        resp.raise_for_status()
        data = resp.json()
        return data.get("results", [])
    except Exception as e:
        print(f"Ошибка поиска в AUR: {e}", file=sys.stderr)
        return []


def get_pkg_info(pkg_name):
    """Получает полную информацию о пакете из AUR."""
    url = f"{AUR_RPC_URL}?v=5&type=info&arg[]={quote(pkg_name)}"
    headers = {"User-Agent": USER_AGENT}
    try:
        resp = requests.get(url, headers=headers, timeout=10)
        resp.raise_for_status()
        data = resp.json()
        if data.get("results"):
            return data["results"][0]
    except Exception as e:
        print(f"Ошибка получения информации о пакете: {e}", file=sys.stderr)
    return None


def clone_pkgbuild(pkg_name, dest_dir):
    """Клонирует PKGBUILD из AUR."""
    aur_url = f"https://aur.archlinux.org/{pkg_name}.git"
    try:
        subprocess.run(["git", "clone", aur_url, dest_dir], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return True
    except subprocess.CalledProcessError:
        print(f"Не удалось клонировать репозиторий: {aur_url}", file=sys.stderr)
        return False


def install_system_deps(depends):
    """Устанавливает зависимости из официальных репозиториев через pacman."""
    if not depends:
        return
    print("Установка системных зависимостей...")
    cmd = ["sudo", "pacman", "-S", "--needed", "--noconfirm"] + depends
    try:
        subprocess.run(cmd, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Ошибка установки зависимостей: {e}", file=sys.stderr)


def build_and_install(pkg_dir):
    """Собирает и устанавливает пакет через makepkg."""
    print("Сборка и установка пакета...")
    try:
        subprocess.run(["makepkg", "-si", "--noconfirm"], cwd=pkg_dir, check=True)
        return True
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при сборке или установке: {e}", file=sys.stderr)
        return False


def install_package(pkg_name):
    """Основная логика установки пакета из AUR."""
    print(f"Поиск пакета: {pkg_name}")
    results = aur_search(pkg_name)
    if not results:
        print(f"Пакет '{pkg_name}' не найден в AUR.", file=sys.stderr)
        sys.exit(1)

    # Ищем точное совпадение или берем первый результат
    pkg = None
    for p in results:
        if p["Name"] == pkg_name:
            pkg = p
            break
    if not pkg:
        pkg = results[0]
        print(f"Точное совпадение не найдено. Выбран: {pkg['Name']}")

    print(f"\nНайден пакет: {pkg['Name']} (версия {pkg['Version']})")
    print(f"Описание: {pkg.get('Description', 'Нет описания')}")
    print(f"URL: https://aur.archlinux.org/packages/{pkg['Name']}\n")

    confirm = input("Продолжить установку? [Y/n]: ").strip().lower()
    if confirm in ("n", "no"):
        print("Отмена.")
        sys.exit(0)

    full_info = get_pkg_info(pkg["Name"])
    if not full_info:
        print("Не удалось получить полную информацию о пакете.", file=sys.stderr)
        sys.exit(1)

    with tempfile.TemporaryDirectory() as tmpdir:
        pkg_dir = os.path.join(tmpdir, pkg["Name"])
        if not clone_pkgbuild(pkg["Name"], pkg_dir):
            sys.exit(1)

        deps = full_info.get("Depends", [])
        install_system_deps(deps)

        if build_and_install(pkg_dir):
            print(f"\n✅ Пакет '{pkg['Name']}' успешно установлен!")
        else:
            print("\n❌ Установка не удалась.", file=sys.stderr)
            sys.exit(1)


def main():
    parser = argparse.ArgumentParser(
        prog="aurix",
        description="Простой AUR-хелпер на Python",
        epilog="Примеры:\n  aurix -s firefox\n  aurix -S visual-studio-code-bin",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    parser.add_argument(
        "-V", "--version",
        action="version",
        version=f"aurix {VERSION}"
    )
    parser.add_argument(
        "-s", "--search",
        metavar="QUERY",
        help="Поиск пакетов в AUR"
    )
    parser.add_argument(
        "-S", "--sync",
        metavar="PACKAGE",
        help="Установить пакет из AUR"
    )

    # Если запущен без аргументов — показываем логотип и help
    if len(sys.argv) == 1:
        print(LOGO)
        parser.print_help()
        sys.exit(0)

    args = parser.parse_args()

    if args.search:
        results = aur_search(args.search)
        if not results:
            print("Ничего не найдено.")
            return
        for pkg in results[:10]:
            print(f"{pkg['Name']} - {pkg.get('Version', 'unknown')}")
            desc = pkg.get('Description')
            if desc:
                print(f"  {desc}")
            print()
    elif args.sync:
        install_package(args.sync)
    else:
        parser.print_help()


if __name__ == "__main__":
    main()