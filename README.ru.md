# lxappearance-labwc

Этот пакет — форк `lxappearance-obconf`, адаптированный под labwc (GTK3-плагин для LXAppearance).

## Что изменено относительно upstream

- Ориентация на сессию:
  - работа в сессиях labwc/Wayland
  - чтение/запись `~/.config/labwc/rc.xml`
  - применение через `labwc --reconfigure` (fallback: `LABWC_PID` + `HUP`)

- Очистка зависимостей:
  - удалена runtime-зависимость от библиотек Openbox (`obrender`/`obt`)
  - для XML/конфига используются `libxml2` + GLib

- Стабильность и очистка UI:
  - убран legacy-путь preview, вызывавший падения в Wayland
  - удалена неработающая панель preview
  - удалена неработающая настройка шрифта неактивного OSD

- Улучшения тем и совместимости:
  - восстановлен поиск тем в `$XDG_DATA_HOME/themes` (например `~/.local/share/themes`)
  - порядок кнопок заголовка маппится в формат labwc (`theme/titlebar/layout`)
  - исправлена обработка `N`: иконка окна остается слева

- Новые настройки labwc во вкладке `Разное`:
  - префикс/количество/начальный рабочий стол/время popup
  - политика размещения и смещения каскада
  - стиль/показ/экран OSD переключателя, preview, outlines
  - режим popup при изменении размера и draw-contents
  - show-title, keep-border, maximized-decoration
  - параметры сгруппированы по тематическим подвкладкам

- Обработка количества рабочих столов:
  - при старте приоритет у `desktops/number`, если значение валидно
  - fallback на `desktops@number`
  - при сохранении обновляются оба формата для гибридной совместимости

## Примечания

- Текущее поведение возвращено к исходной логике: сохранение выполняется по кнопке `Apply`.
- Подробный журнал по релизам: `CHANGELOG.en.md` и `CHANGELOG.ru.md`.
- Целевая совместимость с labwc: `0.9.6` (ключи workspace/placement/switcher OSD/resize/decoration синхронизированы с `docs/rc.xml.all` из `labwc 0.9.6`).

## Мини-тест (парсинг количества рабочих столов)

- Запуск: `python3 tests/test_desktops_number.py`
- Проверяется приоритет чтения из `rc.xml`:
  - сначала `labwc_config/desktops/number`
  - затем `labwc_config/desktops@number`
  - fallback на `labwc_config/core/desktops`
  - затем рекурсивный fallback

## Smoke-тест (labwc 0.9.6)

- Запуск: `python3 tests/smoke_labwc_096.py`
- Проверка пользовательского файла: `python3 tests/smoke_labwc_096.py --rc ~/.config/labwc/rc.xml`
- Тест проверяет наличие ключей, используемых плагином, в структуре labwc 0.9.6 (включая атрибуты `windowSwitcher`/`osd`).
