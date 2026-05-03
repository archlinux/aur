#!/bin/bash

# --- НАСТРОЙКИ ---
# Укажи путь к папке с кодом, если хочешь, чтобы он и GitHub обновлял
CODE_DIR="/home/rootly/dotmaster" 
# -----------------

set -e

echo "  Запуск полной автоматизации..."

# 1. ОБНОВЛЯЕМ PKGREL (Автоинкремент)
# Магия sed: находит число после pkgrel= и прибавляет 1
sed -i 's/pkgrel=\([0-9]\+\)/echo "pkgrel=$((\1+1))"/e' PKGBUILD

# Достаем новые значения для логов
NEW_REL=$(grep "^pkgrel=" PKGBUILD | cut -d= -f2)
PKG_VER=$(grep "^pkgver=" PKGBUILD | cut -d= -f2)

echo "   pkgrel автоматически поднят до $NEW_REL"

# 2. ГЕНЕРИРУЕМ SRCINFO
echo " 󰚰  Обновление .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

# 3. ЧИСТИМ ГИТ И ПУШИМ
echo " 󰊢  Отправка в AUR..."

# На всякий случай сбрасываем индекс, чтобы не улетело лишнее
git add PKGBUILD .SRCINFO publish.sh

# Проверяем, есть ли что коммитить
if git diff-index --quiet HEAD --; then
    echo " 󰛨  Изменений нет, пушить нечего."
else
    git commit -m "auto-update: v$PKG_VER-$NEW_REL"
    git push origin master
    echo " 󰄬  Готово! Пакет v$PKG_VER-$NEW_REL уже в AUR."
fi

echo "---"
echo "Теперь просто пиши: yay -S dotmaster-git --clean"