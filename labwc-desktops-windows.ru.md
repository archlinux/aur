# Настройка рабочих столов и окон в labwc

Практическое руководство по `rc.xml`: рабочие столы (workspaces), тайлинг,
снап‑регионы, переключение и управление окнами. Основано на официальных
`labwc-config(5)` и `labwc-actions(5)`.

---

## 1. Где лежит конфиг и как применить изменения

- Файл: `~/.config/labwc/rc.xml`
- Корневой элемент всегда `<labwc_config>`:

  ```xml
  <?xml version="1.0"?>
  <labwc_config>
    <!-- настройки -->
  </labwc_config>
  ```

- Применить без перезапуска сессии:

  ```sh
  labwc --reconfigure          # либо: kill -HUP "$(pidof labwc)"
  ```

  (`labhotkey`/`labsetup` вызывают это автоматически при сохранении.)

- Синтаксис гибкий — эти три записи эквивалентны:

  ```xml
  <action name="Execute" command="foot" />
  <action name="Execute"><command>foot</command></action>
  <action><name>Execute</name><command>foot</command></action>
  ```

- Булевы значения: `yes|no`, `true|false` или `on|off` — на выбор.

> **labwc и Openbox.** labwc читает конфиг в формате Openbox (тот же `rc.xml` со
> схожим синтаксисом), поэтому `labhotkey` правит его через плагин `Openbox` —
> из‑за этого в `man labhotkey`, раздел **SUPPORTED WINDOW MANAGERS**,
> перечислены и `labwc`, и `Openbox`. «Исключили» же мы не плагин, а
> openbox‑специфичные **действия**: список в `labhotkey` ограничен действиями
> labwc, а `DirectionalCycleWindows`, `AddDesktop`, `RemoveDesktop`,
> `SendToLayer`, `Restart` и подобные убраны. Итого: общий у них формат конфига,
> но набор действий — только labwc (полный список — в
> [labhotkey.ru.md](../doc/labhotkey.ru.md)).

---

## 2. Синтаксис клавиш

Формат привязки: `модификатор-клавиша`. Модификаторы:

| Код          | Клавиша              |
| ------------ | -------------------- |
| `W` (Mod4)   | Super / Win / Logo   |
| `A` (Mod1)   | Alt                  |
| `C`          | Control              |
| `S`          | Shift                |
| `M` (Mod5)   | Meta                 |
| `H` (Mod3)   | Hyper                |

- Комбинация модификаторов: `W-S-Left` = Super + Shift + Влево.
- Клавиша — любой символ или имя: `Return`, `Tab`, `Escape`, `F4`,
  `Left` / `Right` / `Up` / `Down`, `space`, `1`…`0`, `KP_4` (numpad) и т. д.
- Узнать точное имя клавиши: утилита `wev` (Wayland event viewer).
- `<keyboard><default/>` — подгрузить стандартные привязки labwc **в дополнение**
  к вашим.

> ⚠️ Одна клавиша — одно действие. Следите за конфликтами: если `W-Left`
> занят под тайлинг, не вешайте на него же переключение стола.

---

## 3. Рабочие столы (workspaces)

Рабочий стол в labwc охватывает **все** мониторы.

### 3.1 Объявление столов

```xml
<desktops number="4">              <!-- минимум 4 стола -->
  <popupTime>1000</popupTime>      <!-- мс показа OSD при переключении; 0 — не показывать -->
  <prefix>Стол</prefix>            <!-- префикс авто-имён (по умолчанию "Workspace") -->
  <names>                          <!-- явные имена (необязательно) -->
    <name>Основной</name>
    <name>Веб</name>
    <name>Код</name>
    <name>Медиа</name>
  </names>
  <initial>1</initial>             <!-- стартовый стол: имя или индекс -->
</desktops>
```

- `number` задаёт **минимальное** число столов; если он указан, блок `names`
  не обязателен (имена сгенерируются как `Стол 1`, `Стол 2`, …).

### 3.2 Переключение между столами — `GoToDesktop`

Параметр `to`:
`current`, `last`, `left`, `right`, `left-occupied`, `right-occupied`,
**имя** стола или **индекс** (с 1).
`wrap` `[yes|no]` — переход по кругу (по умолчанию `yes`).
`toggle` `[yes|no]` — если уже на целевом столе, вернуться на `last`.

```xml
<keybind key="W-1"><action name="GoToDesktop" to="1"/></keybind>
<keybind key="W-2"><action name="GoToDesktop" to="2"/></keybind>
<keybind key="C-A-Right"><action name="GoToDesktop" to="right"/></keybind>
<keybind key="C-A-Left"><action name="GoToDesktop" to="left" wrap="no"/></keybind>
```

### 3.3 Перенос окна на стол — `SendToDesktop`

`to` — как у `GoToDesktop`.
`follow` `[yes|no]` — переключиться следом за окном (по умолчанию `yes`).
`wrap` `[yes|no]` — по кругу (по умолчанию `yes`).

```xml
<keybind key="W-S-1"><action name="SendToDesktop" to="1"/></keybind>
<keybind key="C-A-S-Right"><action name="SendToDesktop" to="right" follow="no"/></keybind>
```

### 3.4 Показать окно на всех столах (sticky)

```xml
<keybind key="W-o"><action name="ToggleOmnipresent"/></keybind>
```

---

## 4. Управление окнами

### 4.1 Базовые действия

```xml
<keybind key="A-F4"><action name="Close"/></keybind>              <!-- закрыть -->
<keybind key="W-n"><action name="Iconify"/></keybind>            <!-- свернуть -->
<keybind key="W-m"><action name="ToggleMaximize"/></keybind>     <!-- развернуть/восстановить -->
<keybind key="W-f"><action name="ToggleFullscreen"/></keybind>   <!-- полный экран -->
<keybind key="W-t"><action name="ToggleDecorations"/></keybind>  <!-- заголовок/рамка -->
<keybind key="W-p"><action name="ToggleAlwaysOnTop"/></keybind>  <!-- поверх всех окон -->
```

- `ToggleMaximize` / `Maximize` / `Unmaximize` принимают
  `direction` `[both|horizontal|vertical]` (по умолчанию `both`).

### 4.2 Тайлинг: половины и четверти экрана — `SnapToEdge`

`direction`: `left | right | up | down | up-left | up-right | down-left | down-right | center`.
`combine` `[yes|no]` — сложить два направления в четверть (сначала, например,
`right`, затем `up` даст верхнюю правую четверть).

```xml
<keybind key="W-Left"><action name="SnapToEdge" direction="left"/></keybind>
<keybind key="W-Right"><action name="SnapToEdge" direction="right"/></keybind>
<keybind key="W-Up"><action name="SnapToEdge" direction="up"/></keybind>
<keybind key="W-Down"><action name="SnapToEdge" direction="down"/></keybind>
```

> Верхний край по умолчанию разворачивает окно (см. `<snapping><topMaximize>`).

### 4.3 Двигать к краю без изменения размера — `MoveToEdge`

`direction` `[left|up|right|down]`; `snapWindows` `[yes|no]` — цепляться к
краям соседних окон (по умолчанию `yes`).

```xml
<keybind key="A-Left"><action name="MoveToEdge" direction="left"/></keybind>
<keybind key="A-Right"><action name="MoveToEdge" direction="right"/></keybind>
```

### 4.4 Наращивать/уменьшать до края — `GrowToEdge` / `ShrinkToEdge`

`direction` `[left|up|right|down]`.

```xml
<keybind key="W-C-Right"><action name="GrowToEdge" direction="right"/></keybind>
<keybind key="W-C-S-Right"><action name="ShrinkToEdge" direction="right"/></keybind>
```

### 4.5 Снап‑регионы (произвольные зоны) — `<regions>` + `SnapToRegion`

Опишите зоны в процентах от рабочей области монитора, затем цепляйте окна
действием `SnapToRegion` **или** перетаскиванием окна с зажатым модификатором
(Ctrl / Alt / Shift / Logo).

```xml
<regions>
  <region name="left"   x="0%"  y="0%" width="50%" height="100%"/>
  <region name="right"  x="50%" y="0%" width="50%" height="100%"/>
  <region name="center" x="15%" y="8%" width="70%" height="84%"/>
</regions>
```

```xml
<keybind key="W-KP_4"><action name="SnapToRegion" region="left"/></keybind>
<keybind key="W-KP_5"><action name="SnapToRegion" region="center"/></keybind>
<keybind key="W-KP_6"><action name="SnapToRegion" region="right"/></keybind>
```

### 4.6 Поведение снапа при перетаскивании мышью — `<snapping>`

```xml
<snapping>
  <range>
    <inner>10</inner>   <!-- срабатывание у края с соседним монитором, px -->
    <outer>10</outer>   <!-- срабатывание у внешнего края, px; 0 в обоих — выключить -->
  </range>
  <cornerRange>50</cornerRange>              <!-- зона угла для четвертей, px -->
  <topMaximize>yes</topMaximize>             <!-- верхний край = развернуть -->
  <overlay><enabled>yes</enabled></overlay>  <!-- подсветка целевой зоны -->
</snapping>
```

### 4.7 Переключение между окнами

```xml
<keybind key="A-Tab"><action name="NextWindow"/></keybind>
<keybind key="A-S-Tab"><action name="PreviousWindow"/></keybind>
```

Параметры `NextWindow` / `PreviousWindow`:

- `workspace` `[all|current]` — по всем столам или текущему (по умолчанию `current`);
- `output` `[all|focused|cursor]` — по каким мониторам (по умолчанию `all`);
- `identifier` `[all|current]` — все окна или только текущего приложения.

Варианты `NextWindowImmediate` / `PreviousWindowImmediate` переключают без OSD —
удобно вешать на клавиши без модификатора.

### 4.8 Несколько мониторов

```xml
<keybind key="W-S-Left"><action name="MoveToOutput" direction="left"/></keybind>
<keybind key="W-S-Right"><action name="MoveToOutput" direction="right"/></keybind>
<keybind key="W-grave"><action name="FocusOutput" direction="right" wrap="yes"/></keybind>
```

`MoveToOutput` / `FocusOutput`: `output` (имя) **или** `direction`
`[left|right|up|down]`; `wrap` `[yes|no]`.

---

## 5. Мышь: перемещение и изменение размера окон

```xml
<mouse>
  <context name="Frame">
    <!-- Super + ЛКМ тянуть — двигать окно -->
    <mousebind button="W-Left" action="Drag"><action name="Move"/></mousebind>
    <!-- Super + ПКМ тянуть — менять размер -->
    <mousebind button="W-Right" action="Drag"><action name="Resize"/></mousebind>
  </context>
  <context name="Titlebar">
    <mousebind button="Left" action="Drag"><action name="Move"/></mousebind>
    <mousebind button="Left" action="DoubleClick"><action name="ToggleMaximize"/></mousebind>
  </context>
  <context name="Root">
    <!-- средняя/правая кнопка на пустом месте — меню -->
    <mousebind button="Right" action="Press"><action name="ShowMenu" menu="root-menu"/></mousebind>
  </context>
</mouse>
```

---

## 6. Полезные глобальные настройки

```xml
<focus>
  <followMouse>no</followMouse>     <!-- отдавать фокус окну под курсором -->
  <raiseOnFocus>no</raiseOnFocus>   <!-- поднимать окно при фокусе -->
</focus>

<core>
  <gap>6</gap>                       <!-- зазор между окнами и краями при тайлинге, px -->
</core>

<placement>
  <policy>cascade</policy>           <!-- center | automatic | cursor | cascade -->
</placement>
```

---

## 7. Отладка

| Задача                       | Команда                                       |
| ---------------------------- | --------------------------------------------- |
| Узнать имя клавиши           | `wev`                                         |
| Применить конфиг             | `labwc --reconfigure`                         |
| Проверить XML на корректность| `xmllint --noout ~/.config/labwc/rc.xml`      |

---

## 8. Готовый пример `rc.xml` (с комментариями)

Скопируйте в `~/.config/labwc/rc.xml`. Схема без конфликтов:
**столы** — на `W-1..4` (переход) и `W-S-1..4` (перенос);
**тайлинг** — на стрелки `W-<стрелка>`;
**переключение окон** — `A-Tab`.

```xml
<?xml version="1.0"?>
<labwc_config>

  <!-- ============ РАБОЧИЕ СТОЛЫ ============ -->
  <desktops number="4">
    <popupTime>800</popupTime>
    <names>
      <name>Основной</name>
      <name>Веб</name>
      <name>Код</name>
      <name>Медиа</name>
    </names>
    <initial>1</initial>
  </desktops>

  <!-- ============ ФОКУС И РАЗМЕЩЕНИЕ ============ -->
  <focus>
    <followMouse>no</followMouse>
    <raiseOnFocus>no</raiseOnFocus>
  </focus>
  <placement>
    <policy>cascade</policy>
  </placement>
  <core>
    <gap>6</gap>
  </core>

  <!-- ============ СНАП: перетаскивание к краям ============ -->
  <snapping>
    <range><inner>10</inner><outer>10</outer></range>
    <cornerRange>50</cornerRange>
    <topMaximize>yes</topMaximize>
    <overlay><enabled>yes</enabled></overlay>
  </snapping>

  <!-- ============ СНАП-РЕГИОНЫ (по желанию) ============ -->
  <regions>
    <region name="left"   x="0%"  y="0%" width="50%" height="100%"/>
    <region name="right"  x="50%" y="0%" width="50%" height="100%"/>
    <region name="center" x="15%" y="8%" width="70%" height="84%"/>
  </regions>

  <!-- ============ КЛАВИАТУРА ============ -->
  <keyboard>

    <!-- Запуск программ -->
    <keybind key="W-Return"><action name="Execute" command="foot"/></keybind>
    <keybind key="W-space"><action name="ShowMenu" menu="root-menu" atCursor="no"/></keybind>

    <!-- Рабочие столы: переход -->
    <keybind key="W-1"><action name="GoToDesktop" to="1"/></keybind>
    <keybind key="W-2"><action name="GoToDesktop" to="2"/></keybind>
    <keybind key="W-3"><action name="GoToDesktop" to="3"/></keybind>
    <keybind key="W-4"><action name="GoToDesktop" to="4"/></keybind>
    <keybind key="C-A-Left"><action name="GoToDesktop" to="left"/></keybind>
    <keybind key="C-A-Right"><action name="GoToDesktop" to="right"/></keybind>

    <!-- Рабочие столы: перенос активного окна -->
    <keybind key="W-S-1"><action name="SendToDesktop" to="1"/></keybind>
    <keybind key="W-S-2"><action name="SendToDesktop" to="2"/></keybind>
    <keybind key="W-S-3"><action name="SendToDesktop" to="3"/></keybind>
    <keybind key="W-S-4"><action name="SendToDesktop" to="4"/></keybind>
    <keybind key="W-o"><action name="ToggleOmnipresent"/></keybind>

    <!-- Окна: базовое -->
    <keybind key="A-F4"><action name="Close"/></keybind>
    <keybind key="W-n"><action name="Iconify"/></keybind>
    <keybind key="W-m"><action name="ToggleMaximize"/></keybind>
    <keybind key="W-f"><action name="ToggleFullscreen"/></keybind>
    <keybind key="W-t"><action name="ToggleDecorations"/></keybind>
    <keybind key="W-p"><action name="ToggleAlwaysOnTop"/></keybind>

    <!-- Окна: тайлинг половинами (стрелки) -->
    <keybind key="W-Left"><action name="SnapToEdge" direction="left"/></keybind>
    <keybind key="W-Right"><action name="SnapToEdge" direction="right"/></keybind>
    <keybind key="W-Up"><action name="SnapToEdge" direction="up"/></keybind>
    <keybind key="W-Down"><action name="SnapToEdge" direction="down"/></keybind>

    <!-- Окна: снап-регионы (numpad) -->
    <keybind key="W-KP_4"><action name="SnapToRegion" region="left"/></keybind>
    <keybind key="W-KP_5"><action name="SnapToRegion" region="center"/></keybind>
    <keybind key="W-KP_6"><action name="SnapToRegion" region="right"/></keybind>

    <!-- Окна: переключение -->
    <keybind key="A-Tab"><action name="NextWindow"/></keybind>
    <keybind key="A-S-Tab"><action name="PreviousWindow"/></keybind>

    <!-- Несколько мониторов -->
    <keybind key="W-S-Left"><action name="MoveToOutput" direction="left"/></keybind>
    <keybind key="W-S-Right"><action name="MoveToOutput" direction="right"/></keybind>

    <!-- Служебное -->
    <keybind key="W-C-r"><action name="Reconfigure"/></keybind>
    <keybind key="W-C-q"><action name="Exit"/></keybind>

  </keyboard>

  <!-- ============ МЫШЬ ============ -->
  <mouse>
    <context name="Frame">
      <mousebind button="W-Left" action="Drag"><action name="Move"/></mousebind>
      <mousebind button="W-Right" action="Drag"><action name="Resize"/></mousebind>
    </context>
    <context name="Titlebar">
      <mousebind button="Left" action="Drag"><action name="Move"/></mousebind>
      <mousebind button="Left" action="DoubleClick"><action name="ToggleMaximize"/></mousebind>
    </context>
    <context name="Root">
      <mousebind button="Right" action="Press"><action name="ShowMenu" menu="root-menu"/></mousebind>
    </context>
  </mouse>

</labwc_config>
```
