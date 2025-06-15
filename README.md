# PKGBUILD для установки GigaIDE в Arch Linux
## Установка
```shell
git clone https://gitverse.ru/v_chulkin/gigaide-arch.git
cd gigaide-arch
makepkg -si
```

## Удаление
```shell
sudo pacman -Rns gigaide gigaide-debug
```

## Возможные проблемы
Версия пакета может быть недоуступна по прямой ссылке, можно будет 
- скачать актуальную версию .tar.gz здесь https://gitverse.ru/services/gigaide 
- поместить архив в каталог с данным проектом (тогда не будет скачиваться повторно)
- Изменить `pkgver` до актуальной
- `sha256sums` первый аргумент заменить на актуальный хэш `sha256sum новая_версия.tar.gz`
- Запустить установку `makepkg -si`

Название архива `gigaideCE-242.21829.142` и каталога внутри архива `gigaide-CE-242.21829.142` различается 


## Дополнительная информация
https://wiki.archlinux.org/title/PKGBUILD_(Русский)

https://wiki.archlinux.org/title/PKGBUILD
