#!/usr/bin/env python3
"""Patch Ringbinder sources for B_TRANSLATE and build the Russian catkeys."""

import ast
import pathlib
import re
import sys

TRANSLATIONS = {
    "OK": "ОК",
    "Cancel": "Отмена",
    "Save": "Сохранить",
    "Delete": "Удалить",
    "Edit": "Изменить",
    "Edit\u2026": "Изменить\u2026",
    "Delete\u2026": "Удалить\u2026",
    "New\u2026": "Создать\u2026",
    "Google sync settings\u2026": "Настройки синхронизации Google\u2026",
    "Close": "Закрыть",
    "Connect": "Подключить",
    "Connect\u2026": "Подключить\u2026",
    "Connected": "Подключено",
    "Disconnect": "Отключить",
    "Today": "Сегодня",
    "Today!": "Сегодня!",
    "Tomorrow": "Завтра",
    "Next": "Вперёд",
    "Previous": "Назад",
    "File": "Файл",
    "Entry": "Запись",
    "View": "Вид",
    "Sync": "Синхронизация",
    "Section": "Раздел",
    "Quit": "Выход",
    "About ": "О программе ",
    "About Ringbinder\u2026": "О программе Ringbinder\u2026",
    "New": "Создать",
    "New ": "Создать ",
    "Edit ": "Изменить ",
    "Notes": "Заметки",
    "Date": "Дата",
    "Time": "Время",
    "Type": "Тип",
    "Name": "Название",
    "Title:": "Заголовок:",
    "Category": "Категория",
    "Location": "Место",
    "Priority": "Приоритет",
    "Pri": "Приор.",
    "Description": "Описание",
    "Start time": "Время начала",
    "End time": "Время окончания",
    "Start date": "Дата начала",
    "End date": "Дата окончания",
    "Due date": "Срок",
    "Due": "Срок",
    "E-mail": "Эл. почта",
    "First name": "Имя",
    "Last name": "Фамилия",
    "Company": "Компания",
    "Job title": "Должность",
    "Mobile": "Мобильный",
    "Phone": "Телефон",
    "Address": "Адрес",
    "Address tab \u2194 Google Contacts": "Вкладка Адреса \u2194 Google Контакты",
    "Calendar tab \u2194 Google Calendar": "Вкладка Календарь \u2194 Google Календарь",
    "Google account": "Учётная запись Google",
    "Google sync": "Синхронизация Google",
    "Client ID:": "ID клиента:",
    "Client secret:": "Секрет клиента:",
    "Calendar ID:": "ID календаря:",
    "Sync automatically:": "Синхронизировать автоматически:",
    "Only when I ask": "Только по запросу",
    "Every 15 minutes": "Каждые 15 минут",
    "Every 30 minutes": "Каждые 30 минут",
    "Every hour": "Каждый час",
    "Every 4 hours": "Каждые 4 часа",
    "What to sync": "Что синхронизировать",
    "Sync now": "Синхронизировать сейчас",
    "Sync with Google now": "Синхронизировать с Google сейчас",
    "Google sync settings": "Настройки синхронизации Google",
    "Syncing\u2026": "Синхронизация\u2026",
    "Syncing": "Синхронизация",
    "Mark done / not done": "Отметить выполненной / невыполненной",
    "Mark done": "Отметить выполненной",
    "All": "Все",
    "Current": "Текущие",
    "Future": "Будущие",
    "Completed": "Завершённые",
    "Overdue": "Просрочено",
    "\u2713 Yes": "\u2713 Да",
    "Double-click the card to edit": "Двойной щелчок по карточке — изменить",
    "in %d days": "через %d дн.",
    "%d of %d shown": "Показано %d из %d",
    "Select a %s to see it here.": "Выберите %s, чтобы увидеть его здесь.",
    "No %ss behind this tab.": "За этой вкладкой нет записей (%s).",
    "No %ss yet.\nClick \"New %s\" to add one.": "Пока нет записей [%s].\nНажмите \"Создать %s\", чтобы добавить.",
    "Today": "Сегодня",
    "tomorrow": "завтра",
    "today": "сегодня",
    "+ %d more": "+ ещё %d",
    "+ %d more\u2026": "+ ещё %d\u2026",
    "New appointment": "Новая встреча",
    "Edit appointment": "Изменить встречу",
    "New occasion": "Новое событие",
    "Edit Occasion": "Изменить событие",
    "Occasion": "Событие",
    "New event": "Новое событие",
    "New planner event": "Новое событие планировщика",
    "Edit planner event": "Изменить событие планировщика",
    "Event": "Событие",
    "This week": "Эта неделя",
    "This year": "Этот год",
    "Next \u25b6": "Вперёд \u25b6",
    "Next week \u25b6": "Следующая неделя \u25b6",
    "\u25c0 Prev": "\u25c0 Назад",
    "\u25c0 Previous week": "\u25c0 Предыдущая неделя",
    "Drag across days to add an event": "Протяните по дням, чтобы добавить событие",
    "New page": "Новая страница",
    "Untitled page": "Безымянная страница",
    "Contents": "Содержание",
    "Calendar": "Календарь",
    "To Do": "Задачи",
    "Calls": "Звонки",
    "Planner": "Планировщик",
    "Notepad": "Заметки",
    "Anniversary": "Годовщины",
    "Holiday": "Праздник",
    "Birthday": "День рождения",
    "Business": "Работа",
    "Personal": "Личное",
    "Home": "Дом",
    "Errands": "Поручения",
    "Other": "Другое",
    "Travel": "Поездка",
    "Vacation": "Отпуск",
    "Training": "Обучение",
    "Meeting": "Встреча",
    "Task": "Задача",
    "Contact": "Контакт",
    "Call": "Звонок",
    "Business|Personal|Travel|Holiday|Other": "Работа|Личное|Поездка|Праздник|Другое",
    "Business|Personal|Home|Errands|Other": "Работа|Личное|Дом|Поручения|Другое",
    "Outgoing|Incoming|Missed|Call back": "Исходящий|Входящий|Пропущенный|Перезвонить",
    "Birthday|Anniversary|Holiday|Other": "День рождения|Годовщина|Праздник|Другое",
    "Meeting|Vacation|Travel|Training|Holiday|Other": "Встреча|Отпуск|Поездка|Обучение|Праздник|Другое",
    "2 - Normal|1 - High|3 - Low": "2 — Обычный|1 — Высокий|3 — Низкий",
    "HH:MM (24 hour)": "ЧЧ:ММ (24 часа)",
    "YYYY-MM-DD, or \"today\"": "ГГГГ-ММ-ДД или \"сегодня\"",
    "Please fill in \"%s\".": "Заполните \"%s\".",
    "Please use 24-hour HH:MM, for example 14:30.": "Используйте 24-часовой формат ЧЧ:ММ, например 14:30.",
    "Please use the form YYYY-MM-DD, for example %s.": "Используйте формат ГГГГ-ММ-ДД, например %s.",
    "\"%s\" is not a valid date.\n\n": "\"%s\" — некорректная дата.\n\n",
    "\"%s\" is not a valid time.\n\n": "\"%s\" — некорректное время.\n\n",
    "Delete \"%s\"?\n\nThis cannot be undone.": "Удалить \"%s\"?\n\nЭто действие нельзя отменить.",
    "Your organizer data could not be read (%s).\n\n": "Не удалось прочитать данные органайзера (%s).\n\n",
    "Ringbinder will start with an empty binder.": "Ringbinder запустится с пустой папкой.",
    "Your organizer could not be saved.": "Не удалось сохранить органайзер.",
    "Could not start Google sign-in.": "Не удалось начать вход в Google.",
    "Disconnect Ringbinder from your Google account?\n\n": "Отключить Ringbinder от вашей учётной записи Google?\n\n",
    "Your appointments and contacts stay in Ringbinder and in ": "Ваши встречи и контакты останутся в Ringbinder и в ",
    "Google; they just stop syncing.": "Google; они просто перестанут синхронизироваться.",
    "A tabbed personal organizer for Haiku, in the spirit of ": "Закладный персональный органайзер для Haiku, в духе ",
    "the classic desktop organizers of the late 1990s.\n\n": "классических настольных органайзеров конца 1990-х.\n\n",
    "Calendar \u2022 To Do \u2022 Address \u2022 ": "Календарь \u2022 Задачи \u2022 Адреса \u2022 ",
    "Calls \u2022 Planner \u2022 Notepad \u2022 ": "Звонки \u2022 Планировщик \u2022 Заметки \u2022 ",
    "Welcome to Ringbinder": "Добро пожаловать в Ringbinder",
    "Ringbinder keeps your diary, tasks, contacts, calls, year planner, ": "Ringbinder хранит ваш дневник, задачи, контакты, звонки, годовой планировщик, ",
    "notes and anniversaries in one binder.\n\n": "заметки и годовщины в одной папке.\n\n",
    "\u2022 Click a coloured tab to turn to its section, or ": "\u2022 Нажмите цветную вкладку, чтобы перейти в раздел, или ",
    "press Alt+1 \u2026 Alt+7. Like the dividers in a real ": "нажмите Alt+1 \u2026 Alt+7. Как разделители в настоящей ",
    "binder, the tabs of the sections you have turned past move to ": "папке, вкладки пролистанных разделов перемещаются на ",
    "the left-hand edge.\n": "левый край.\n",
    "\u2022 Double-click an empty day in the Calendar to add an ": "\u2022 Двойной щелчок по пустому дню в Календаре добавляет ",
    "appointment; double-click an entry to edit it.\n": "встречу; двойной щелчок по записи открывает её редактирование.\n",
    "\u2022 In the Planner, drag across days to block out a ": "\u2022 В Планировщике протяните по дням, чтобы отметить ",
    "vacation or trip.\n": "отпуск или поездку.\n",
    "\u2022 Anniversaries and due To Do items show up on the ": "\u2022 Годовщины и задачи с истекающим сроком отображаются на ",
    "Calendar automatically.\n\n": "Календаре автоматически.\n\n",
    "Everything is saved as you go, in ": "Все изменения сохраняются автоматически в ",
    "Ringbinder syncs the Calendar tab with Google Calendar and the ": "Ringbinder синхронизирует вкладку Календарь с Google Календарём, а ",
    "Address tab with Google Contacts, both ways.\n\n": "вкладку Адреса с Google Контактами, в обе стороны.\n\n",
    "It connects with your own Google OAuth client, so your data goes ": "Подключение выполняется через ваш собственный OAuth-клиент Google, поэтому данные идут ",
    "straight between this computer and Google. To get one (once):\n": "напрямую между этим компьютером и Google. Чтобы получить его (один раз):\n",
    "1. Open console.cloud.google.com and create a project.\n": "1. Откройте console.cloud.google.com и создайте проект.\n",
    "2. Enable the \"Google Calendar API\" and the \"People API\".\n": "2. Включите \"Google Calendar API\" и \"People API\".\n",
    "3. Set up the OAuth consent screen (External) and add your Google ": "3. Настройте экран согласия OAuth (Внешний) и добавьте свой адрес Google ",
    "address as a test user.\n": "в качестве тестового пользователя.\n",
    "4. Under Credentials, create an OAuth client ID of type ": "4. В разделе Учётные данные создайте ID клиента OAuth типа ",
    "\"Desktop app\".\n": "\"Приложение для настольного компьютера\".\n",
    "5. Paste the client ID and secret below and click Connect.": "5. Вставьте ID клиента и секрет ниже и нажмите Подключить.",
    "account": "учётной записи",
    "calendar, use the Calendar ID from its settings page in Google ": "календаря, используйте ID календаря на странице настроек в Google ",
    "Please paste the client ID first. It ends ": "Сначала вставьте ID клиента. Он заканчивается на ",
    "in \".apps.googleusercontent.com\".": "на \".apps.googleusercontent.com\".",
    "\"primary\" is your main calendar. For another ": "\"primary\" — ваш основной календарь. Для другого ",
    "Connected.": "Подключено.",
    "Connected. Not synced yet.": "Подключено. Ещё не синхронизировано.",
    "Not connected.": "Не подключено.",
    "Everything is up to date.": "Всё актуально.",
    "Sign-in failed.": "Не удалось войти.",
    "Could not open the web browser.": "Не удалось открыть веб-браузер.",
    "Last sync ": "Последняя синхронизация ",
    " (and %d more problems)": " (и ещё %d проблем)",
    "Google did not grant offline ": "Google не предоставил офлайн-",
    "access. Remove Ringbinder under your Google Account's ": "доступ. Удалите Ringbinder в разделе стороннего доступа ",
    "third-party access page and connect again.": "вашей учётной записи Google и подключитесь снова.",
    "Waiting for you to sign in to Google in the ": "Ожидание входа в Google в ",
    "browser\u2026": "браузере\u2026",
    "January": "января",
    "February": "февраля",
    "March": "марта",
    "April": "апреля",
    "May": "мая",
    "June": "июня",
    "July": "июля",
    "August": "августа",
    "September": "сентября",
    "October": "октября",
    "November": "ноября",
    "December": "декабря",
    "Jan": "янв",
    "Feb": "фев",
    "Mar": "мар",
    "Apr": "апр",
    "Jun": "июн",
    "Jul": "июл",
    "Aug": "авг",
    "Sep": "сен",
    "Oct": "окт",
    "Nov": "ноя",
    "Dec": "дек",
    "Monday": "понедельник",
    "Tuesday": "вторник",
    "Wednesday": "среда",
    "Thursday": "четверг",
    "Friday": "пятница",
    "Saturday": "суббота",
    "Sunday": "воскресенье",
    "Mon": "пн",
    "Tue": "вт",
    "Wed": "ср",
    "Thu": "чт",
    "Fri": "пт",
    "Sat": "сб",
    "Sun": "вс",
}

CONTEXTS = {
    "AnniversarySection.cpp": "AnniversarySection",
    "App.cpp": "App",
    "BinderWindow.cpp": "BinderWindow",
    "CalendarSection.cpp": "CalendarSection",
    "Constants.cpp": "Constants",
    "DataStore.cpp": "DataStore",
    "DateUtil.cpp": "DateUtil",
    "EditWindow.cpp": "EditWindow",
    "GoogleSettingsWindow.cpp": "GoogleSettingsWindow",
    "GoogleSync.cpp": "GoogleSync",
    "NotepadSection.cpp": "NotepadSection",
    "PlannerSection.cpp": "PlannerSection",
    "RecordListSection.cpp": "RecordListSection",
    "Section.cpp": "Section",
    "SectionFactory.cpp": "SectionFactory",
}

TOKEN = r'(?:"(?:[^"\\]|\\.)*"|\b(?:B_UTF8_ELLIPSIS|APP_NAME)\b)'
RUN = re.compile(TOKEN + r'(?:\s*' + TOKEN + r')*')
TRANSLATED = re.compile(r'B_TRANSLATE\(("(?:[^"\\]|\\.)*")\)')
MACROS = {'B_UTF8_ELLIPSIS': '\u2026', 'APP_NAME': 'Ringbinder'}


def decode(literal):
    try:
        return ast.literal_eval(literal)
    except (ValueError, SyntaxError):
        return None


def encode(value):
    parts = []
    for byte in value.encode('utf-8'):
        if byte == 0x22:
            parts.append('\\"')
        elif byte == 0x5c:
            parts.append('\\\\')
        elif byte == 0x0a:
            parts.append('\\n')
        elif byte == 0x09:
            parts.append('\\t')
        elif 0x20 <= byte < 0x7f:
            parts.append(chr(byte))
        else:
            parts.append('\\%03o' % byte)
    return '"' + ''.join(parts) + '"'


def run_value(run):
    value = ''
    for match in re.finditer(TOKEN, run):
        token = match.group(0)
        if token in MACROS:
            value += MACROS[token]
        else:
            decoded = decode(token)
            if decoded is None:
                return None
            value += decoded
    return value


def patch(root):
    changed = []
    for name, context in CONTEXTS.items():
        path = root / name
        if not path.exists():
            continue
        text = path.read_text()
        if "B_TRANSLATION_CONTEXT" not in text:
            include_at = text.find("\n", text.find('#include "'))
            while include_at >= 0 and text[include_at + 1:].startswith("#include"):
                include_at = text.find("\n", include_at + 1)
            if include_at < 0:
                include_at = 0
            header = (
                "\n#include <Catalog.h>\n\n"
                "#undef B_TRANSLATION_CONTEXT\n"
                f'#define B_TRANSLATION_CONTEXT "{context}"\n'
            )
            text = text[:include_at + 1] + header + text[include_at + 1:]
        text = text.replace('" 1.0\\n\\n"', '" 1.3.0\\n\\n"')

        def wrap(match):
            run = match.group(0)
            line_start = text.rfind('\n', 0, match.start()) + 1
            line_end = text.find('\n', match.end())
            if line_end < 0:
                line_end = len(text)
            if '#define B_TRANSLATION_CONTEXT' in text[line_start:line_end]:
                return run
            start = max(0, match.start() - 13)
            if text[start:match.start()].endswith("B_TRANSLATE("):
                return run
            value = run_value(run)
            if value is None or value not in TRANSLATIONS:
                return run
            return f"B_TRANSLATE({encode(value)})"

        new_text = RUN.sub(wrap, text)
        if new_text != path.read_text():
            path.write_text(new_text)
            changed.append(name)
    makefile = root / 'Makefile'
    if makefile.exists():
        text = makefile.read_text()
        old = "  LIBS        := -L$(COSMOE_ROOT)/lib -lbe -ltracker -lcurl \\\n                 -Wl,-rpath,'$(COSMOE_RPATH)'"
        new = "  LIBS        := -L$(COSMOE_ROOT)/lib -lbe -ltracker -lcurl \\\n                 -llocalestub -Wl,-rpath,'$(COSMOE_RPATH)'"
        if old in text:
            makefile.write_text(text.replace(old, new))
            changed.append('Makefile')
        elif '-llocalestub' not in text:
            raise SystemExit('Could not patch Makefile for -llocalestub')
    print("patched: " + ", ".join(changed))


def catkeys(root, output):
    lines = ["1\tenglish\tx-vnd.Ringbinder\t0"]
    seen = set()
    for name in CONTEXTS:
        path = root / name
        if not path.exists():
            continue
        context = CONTEXTS[name]
        for match in TRANSLATED.finditer(path.read_text()):
            value = decode(match.group(1))
            if value is None or value not in TRANSLATIONS:
                continue
            key = (value, context)
            if key in seen:
                continue
            seen.add(key)
            lines.append(f"{value}\t{context}\t\t{TRANSLATIONS[value]}")
    pathlib.Path(output).write_text("\n".join(lines) + "\n")
    print(f"wrote {len(lines) - 1} keys to {output}")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        raise SystemExit("usage: ringbinder-localize.py patch ROOT | catkeys ROOT OUTPUT")
    mode, root_arg = sys.argv[1:3]
    if mode == "patch":
        patch(pathlib.Path(root_arg))
    elif mode == "catkeys":
        if len(sys.argv) != 4:
            raise SystemExit("usage: ringbinder-localize.py catkeys ROOT OUTPUT")
        out_arg = sys.argv[3]
        catkeys(pathlib.Path(root_arg), out_arg)
    else:
        raise SystemExit(f"unknown mode: {mode}")
