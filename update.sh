#!/bin/bash
# Скрипт для автоматического обновления версии в PKGBUILD

# 1. Получаем последнюю версию с GitHub
LATEST_VERSION=$(curl -s https://api.github.com/repos/cacggghp/vk-turn-proxy/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')

if [ -z "$LATEST_VERSION" ]; then
    echo "Ошибка: не удалось получить последнюю версию с GitHub."
    exit 1
fi

echo "Найдена последняя версия: $LATEST_VERSION"

# 2. Получаем текущую версию из PKGBUILD
CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d= -f2)

if [ "$LATEST_VERSION" == "$CURRENT_VERSION" ]; then
    echo "У вас уже прописана самая свежая версия ($CURRENT_VERSION). Обновление не требуется."
    exit 0
fi

# 3. Обновляем PKGBUILD
echo "Обновляем PKGBUILD: $CURRENT_VERSION -> $LATEST_VERSION"
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD

# 4. Собираем пакет
echo "Запускаю сборку и установку..."
makepkg -si
