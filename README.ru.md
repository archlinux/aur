# EasyPaint — сборка из исходников на Cosmoe/Hokku

Этот каталог содержит Arch-пакет `easypaint`, собранный целиком из исходников. Приложение работает поверх Hokku (форк Cosmoe, реализующий API Haiku/BeOS на Linux), но не тащит за собой весь AppImage: системные ICU, Pango, Cairo, X11/Wayland и кодеры используются из зависимостей пакета.

Версии, на которых всё проверено:

- EasyPaint `v0.2.0` (`8255f9ae37d53842005b0e33cf80e097c51db209`)
- Hokku `517999b3ab8263c8ed49a492558f8ef0749fa515`

## Что здесь доработано

- **Сборка из исходников вместо распаковки AppImage.** Пакет получился компактным: бинарник EasyPaint, минимальный набор нужных библиотек Hokku, трансляторов и control look, artwork и каталоги локализаций.
- **Русская локализация интерфейса.** Переведены все 116 строк EasyPaint через Haiku `BCatalog`: `EasyPaint.ru.catkeys` компилируется в `x-vnd.EasyPaint/ru.catalog`. Дополнительно в пакет включены готовые `ru.catalog` для libbe, libtracker и image-трансляторов.
- **Локализованный `.desktop`.** Добавлены `GenericName` и `Comment` для ru, uk, de, es, fr, it, pl, pt_BR, zh_CN и ja; Английский остаётся значением по умолчанию.
- **Исправлен ввод русских букв.** В X11 и Wayland бэкендах первый байт UTF-8 ошибочно принимался за код символа, а `BWindow::SendKeyEvent()` передавал только один байт. Патч `utf8-keys.patch` исправляет оба места и накладывается идемпотентно в `prepare()`.
- **Настройка UI-шрифта.** `easypaint-ui-font` синхронизирует шрифт с GNOME/GTK, хранит выбор в `~/.config/easypaint/ui-font` и пишет конфиг Hokku в `~/.config/cosmoe/system/app_server/fonts`. Лаунчер `/usr/bin/easypaint` вызывает `easypaint-ui-font --auto` перед запуском.
- **Увеличение GTK-шрифта.** `--gtk` берёт размер из GSettings `org.gnome.desktop.interface` (`font-name`, `monospace-font-name`) и добавляет **+4 pt** к обоим шрифтам: в Hokku UI они выглядели слишком мелкими. `--plain` и `--fixed` задают точный размер без надбавки.
- **Приватный рантайм в `/usr/lib/easypaint`.** Лаунчеры в `/usr/bin` только задают `LD_LIBRARY_PATH` и `TRANSLATORS`, поэтому namcap больше не ругается на ELF-файлы вне стандартных путей.
- **Компактная упаковка.** Используются `xz -9e`, `!debug` и `!lto`; не нужные Hokku-приложения и тесты в пакет не попадают. При сборке выполняются тесты пиксельных операций. `noto-fonts` вынесен в `optdepends`: это шрифт по умолчанию, но сеттер откатится на любой доступный family.

## Сеттер шрифта

```
easypaint-ui-font --gtk                 # GNOME/GTK + 4 pt
easypaint-ui-font --plain 'Noto Sans' Regular 16
easypaint-ui-font --fixed 'Noto Sans Mono' Regular 15
easypaint-ui-font --manual              # вернуться к сохранённому вручную размеру
easypaint-ui-font --status              # показать сохранённые настройки
easypaint-ui-font --help
```

Если GSettings недоступны, сеттер читает `~/.config/gtk-3.0/settings.ini` или `~/.config/gtk-4.0/settings.ini`, а при полном отсутствии настроек использует `Noto Sans 16` / `Noto Sans Mono 15`.

## Сборка

Обычно достаточно:

```
makepkg -s
```

В этом sandbox нет passwordless sudo, а `libxkbcommon-x11` не установлен в систему, поэтому используется локальный workaround:

```
export PKG_CONFIG_PATH=/tmp/archdeps/pc
makepkg -d -f
```

Результат: `easypaint-0.2.0-1-x86_64.pkg.tar.xz`. После изменения `PKGBUILD` или source-файлов обновляйте `.SRCINFO`:

```
makepkg --printsrcinfo > .SRCINFO
```

## Namcap

Остатки предупреждений `namcap` после сборки ожидаемы:

- `libbe.so` и `libxkbcommon-x11.so.0` помечаются как uninstalled, потому что `libbe.so` лежит в приватном `/usr/lib/easypaint/lib`, а `libxkbcommon-x11` в этом sandbox не установлен в систему. В зависимостях он объявлен; после `pacman -S libxkbcommon-x11` предупреждение уйдёт.
- `Dependency included, but may not be needed` — транзитивные библиотеки Pango/Cairo/X11 и шрифтов, подтягиваемые через `libbe.so` и системные библиотеки; удалять их из `depends()` нельзя.
- `Dependency bash detected and implicitly satisfied` относится к `#!/bin/sh` в лаунчерах; на Arch `/bin/sh` — это bash.
- `xz: Empty filename, skipping` — особенность вызова `xz` внутри namcap, не проблема пакета.
- Ранее namcap выдавал `E: ELF files outside of a valid path ('opt/')`; после переноса рантайма в `/usr/lib/easypaint` этой ошибки больше нет.

Предупреждения об «unused shared library» для `libharfbuzz.so.0` и `libm.so.6` у сеттера шрифта устранены `-Wl,--as-needed`, а FULL RELRO добавлен через `$LDFLAGS` и `-Wl,-z,relro -Wl,-z,now`.

## Локализация на другой язык

EasyPaint использует не gettext, а Haiku `BCatalog`. Цепочка такая:

```
исходники с B_TRANSLATE()  --collectcatkeys-->  <lang>.catkeys  --linkcatkeys-->  <code>.catalog
```

Готовый каталог должен лежать по пути:

```
/usr/lib/easypaint/share/cosmoe/locale/catalogs/x-vnd.EasyPaint/<code>.catalog
```

где `<code>` — короткий код локали (`ru`, `uk`, `de` и т. д.). Именно код из `LANG` определяет имя файла; короткий код из `LANG=uk_UA.UTF-8` равен `uk`.

### 1. Собрать эталонный `.catkeys`

Команды выполняются из корня этого каталога после первой успешной сборки (нужны `src/cosmoe` и `src/EasyPaint`):

```
inc=(-I"$PWD/src/cosmoe/usr/include")
for d in config os os/app os/game os/interface os/kernel os/locale \
         os/media os/net os/storage os/support os/translation \
         os/be_apps/Tracker private/interface private/shared \
         private/support posix; do
  inc+=(-I"$PWD/src/cosmoe/usr/include/$d")
done
inc+=(-I"$PWD/src/cosmoe/usr/include/os/add-ons/graphics" \
      -I"$PWD/src/EasyPaint/src" -I"$PWD/src/EasyPaint/src/core")

g++ -E -DB_COLLECTING_CATKEYS "${inc[@]}" \
  src/EasyPaint/src/*.cpp src/EasyPaint/src/core/*.cpp > /tmp/EasyPaint.prep.cpp

LD_LIBRARY_PATH="$PWD/src/cosmoe/usr/lib" \
  src/cosmoe/usr/bin/collectcatkeys -s x-vnd.EasyPaint \
  -o EasyPaint.en.catkeys /tmp/EasyPaint.prep.cpp
```

`-DB_COLLECTING_CATKEYS` раскрывает `B_TRANSLATE()`/`B_TRANSLATE_MARK()` в `B_CATKEY`, поэтому в файл попадут все 116 ключей, включая подписи инструментов из `ToolBox.cpp`.

### 2. Подготовить перевод

```
cp EasyPaint.en.catkeys EasyPaint.uk.catkeys
```

Первая строка эталона выглядит так:

```
1	english	x-vnd.EasyPaint	152058525
```

Замените только вторую колонку на понятное название языка и заполните четвёртую колонку переводом:

```
1	ukrainian	x-vnd.EasyPaint	152058525
```

Поля разделены **табуляцией**, всего их четыре:

```
английский текст	контекст	комментарий	перевод
```

Важно:

- не меняйте первые три колонки — контексты (`App`, `PaintWindow`, `ToolBox`, ...) должны совпадать с `B_TRANSLATION_CONTEXT`;
- сохраняйте `fingerprint` (четвёртое число в шапке) из свежесгенерированного эталона; при несовпадении каталог молча не применится;
- сохраняйте `%s`, `\n`, `\"` и многоточие `…` в переводе в том же виде;
- третья колонка (`comment`) сейчас пустая, но её нужно оставить.

### 3. Скомпилировать каталог

```
LD_LIBRARY_PATH="$PWD/src/cosmoe/usr/lib" \
  src/cosmoe/usr/bin/linkcatkeys -s x-vnd.EasyPaint -l uk \
  -o EasyPaint.uk.catalog EasyPaint.uk.catkeys
```

Проверка:

```
LD_LIBRARY_PATH="$PWD/src/cosmoe/usr/lib" \
  src/cosmoe/usr/bin/dumpcatalog EasyPaint.uk.catalog | grep -c '^Key:'
```

Должно быть `116`.

### 4. Добавить в пакет

Добавьте `EasyPaint.uk.catkeys` в `source=()` и его sha256 в `sha256sums=()`, затем в `package()` рядом с русским каталогом:

```
LD_LIBRARY_PATH="$srcdir/cosmoe/usr/lib" \
  "$srcdir/cosmoe/usr/bin/linkcatkeys" -s x-vnd.EasyPaint -l uk \
  -o "$srcdir/EasyPaint.uk.catalog" "$srcdir/EasyPaint.uk.catkeys"
install -m644 "$srcdir/EasyPaint.uk.catalog" \
  "$dest/share/cosmoe/locale/catalogs/x-vnd.EasyPaint/uk.catalog"
```

После этого:

```
makepkg --printsrcinfo > .SRCINFO
makepkg -d -f
```

### 5. Проверить работу

```
LANG=uk_UA.UTF-8 easypaint
```

`LC_ALL` имеет приоритет над `LANG` — снимите его, если перевод не включается. Для проверки без GUI можно использовать маленькую программу с `BCatalog("x-vnd.EasyPaint")`; при `LANG=ru_RU.UTF-8` текущий каталог возвращает, например, `Не сохранять` и `Открыть…`, а при `LANG=C` — английские строки.

Каталоги Hokku (`libbe`, `libtracker`, трансляторы) лежат отдельно. Если нужны системные диалоги на другом языке, добавьте соответствующие `<code>.catalog` для них в `$dest/share/cosmoe/locale/catalogs/x-vnd.Haiku-*/`.
