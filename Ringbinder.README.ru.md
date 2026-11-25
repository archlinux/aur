# Ringbinder — сборка из исходников на Cosmoe/Hokku

Этот каталог содержит Arch-пакет `ringbinder`, собранный целиком из исходников в одном split PKGBUILD вместе с `easypaint`, `hokku-runtime` и `hokku-lib`. Приложение работает поверх Hokku (форк Cosmoe, реализующий API Haiku/BeOS на Linux) и использует общие пакеты, а не страховочные библиотеки из AppImage.

Версии, на которых всё проверено:

- Ringbinder `v1.3.0` (`77f02358acbfcc4b162da5c9e655edcb13d44c4c`)
- Hokku: `517999b3ab8263c8ed49a492558f8ef0749fa515`

## Что здесь доработано

- **Сборка из исходников вместо AppImage.** Не нужен glibc 2.43 от Ubuntu 26.04: создается locally against Hokku из системы. Google sync использует системный `curl`.
- **Общие пакеты Hokku.** Библиотеки и все addons (`/usr/lib/hokku/lib/addons`: трансляторы изображений и control look) приходят из `hokku-lib`; заголовки, инструменты (`rc`, `linkcatkeys`, `dumpcatalog`), artwork и каталоги — из `hokku-runtime`. Для запуска достаточно `hokku-lib`; `hokku-runtime` — `optdepend`, но нужен при сборке.
- **Русская локализация.** В upstream нет ни одного `B_TRANSLATE()`, поэтому `ringbinder-localize.py` добавляет `<Catalog.h>`, контексты и оборачивает 197 пользовательских строк. `Ringbinder.ru.catkeys` компилируется в `x-vnd.Ringbinder/ru.catalog`.
- **Локализованный `.desktop`.** `GenericName` и `Comment` переведены на ru, uk, de, es, fr, it, pl, pt_BR, zh_CN и ja.
- **Приватный каталог приложения.** Бинарник лежит в `/usr/lib/ringbinder/bin`, лаунчер `/usr/bin/ringbinder` только задаёт `LD_LIBRARY_PATH` и `TRANSLATORS`.
- **Исправлена версия в About.** В `Ringbinder.rdef` указано 1.3.0, а в диалоге было 1.0; патч заменяет на 1.3.0.
- **Компактная упаковка.** `xz -9e`, `!debug`, `!lto`; запускаются штатные тесты синхронизации `make test`.

## Сборка

В этом sandbox `hokku-lib` и `hokku-runtime` не установлены в систему, поэтому используется Hokku, собираемый тем же PKGBUILD:

```
makepkg --printsrcinfo > .SRCINFO
export PKG_CONFIG_PATH=/tmp/archdeps/pc
makepkg -d -f
```

Результат: `ringbinder-0.2.0+1.3.0-1-x86_64.pkg.tar.xz`. После изменения `PKGBUILD` или исходников обновляйте `.SRCINFO`.

## Локализация на другой язык

Ringbinder использует Haiku `BCatalog`, а не gettext. Готовый каталог нужно ставить по пути:

```
/usr/lib/hokku/share/cosmoe/locale/catalogs/x-vnd.Ringbinder/<code>.catalog
```

Чтобы добавить язык:

1. Скопируйте `Ringbinder.ru.catkeys` в `Ringbinder.<code>.catkeys`.
2. Во второй колонке шапки укажите название языка; четвёртую колонку каждой строки заполните переводом. Первые три колонки и табуляции менять нельзя.
3. Добавьте файл в `source=()` и его sha256 в `sha256sums=()`.
4. В `package_ringbinder()` вызовите `linkcatkeys -s x-vnd.Ringbinder -l <code> ...` и установите `<code>.catalog` рядом с `ru.catalog`.

Проверка каталога без GUI:

```
LC_ALL=ru_RU.UTF-8 LANG=ru_RU.UTF-8 ringbinder
```

Или минимальная программа с `BCatalog("x-vnd.Ringbinder")`: при `LC_ALL=ru_RU.UTF-8` он возвращает, например, `Сохранить`, `Календарь`, `Новая встреча`; при `LC_ALL=C` — английские строки. `LC_ALL` имеет приоритет над `LANG`, поэтому для headless-проверки надёжнее задавать именно его.
