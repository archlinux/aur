# Argon для Arch Linux

Для чтения PKGBUILD уже должны быть установлены `curl` и `jq`:

```bash
sudo pacman -S --needed curl jq
```

Сборка и установка из этой папки:

```bash
makepkg -si
```

Скрипт `argon-fetch.sh` сначала запрашивает HTML `https://app.argon.gl` и ищет
`<a href="https://…/ArgonChat-x86_64.AppImage">` на одном из известных зеркал:

| Зеркало | Регион |
| --- | --- |
| `https://eu-central-updates.argon.gl` | p0: основной / остальные страны |
| `https://us-central-updates.argon.gl` | p1: US, CA |
| `https://ru-central-updates.argon.gl` | p2: RU, BY; fallback |

Выбор региона берётся из ссылки в HTML. При ошибке запроса, пустом HTML или
отсутствии подходящего `href` используется RU. Каждый запрос curl ограничен
30 секундами, включая скачивание AppImage. Ошибка скачивания прерывает сборку.

Манифест запрашивается из того же региона, что и AppImage: в адресе выбранного
зеркала `-updates.argon.gl` заменяется на `-manifest.argon.gl`, затем добавляется
`/live/release.json`. При fallback на RU используется и RU-манифест.
Версия берётся строкой из его `bootstrapper.version` при чтении PKGBUILD,
включая `makepkg --printsrcinfo`; выбор региона выполняется и в режиме
`argon-fetch.sh --version`. В PKGBUILD нет фиксированного номера версии,
и makepkg не заменяет динамическое выражение на номер при сборке.
Невалидный JSON или отсутствующая/невалидная версия прерывают сборку.
Если версия манифеста изменилась во время сборки, сборка прерывается:
её нужно запустить заново.

AppImage распаковывается во время сборки, поэтому установленному приложению
не нужен FUSE. Запуск: `argon`, `Argon` или через меню приложений.

Только скачивание, без сборки:

```bash
bash ./argon-fetch.sh ./downloads
```

В каталоге появятся AppImage, `release.json` и `argon-version`.

Сборка всегда получает текущий релиз. Для локального скрипта в PKGBUILD
указано `sha256sums=('SKIP')`, поэтому после его правок не нужно пересчитывать
сумму. AppImage скачивается по HTTPS, без проверки upstream-подписи или
закреплённой контрольной суммы. Поле `bootstrapper.full.hash` относится к
`bootstrapper.bin`, а не к AppImage, поэтому для AppImage оно не используется.
