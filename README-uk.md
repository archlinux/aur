# colibri-git

Пакет Colibri, зібраний із гілки Git `main` для Arch Linux та сумісних дистрибутивів. Містить CPU-рушії, команду `coli`, локальний веб/API-сервер і шаблон systemd для незалежного запуску моделей.

Англійська документація: [README.md](README.md).

## Склад пакета

| Шлях | Призначення |
| --- | --- |
| `/usr/bin/coli` | Символьне посилання на `/usr/lib/colibri/coli` |
| `/usr/lib/colibri/` | Рушії та службові компоненти |
| `/usr/lib/colibri/colibri-instance` | Скрипт запуску екземпляра |
| `/usr/lib/systemd/system/colibri@.service` | Шаблон systemd |
| `/usr/share/colibri-git/*.conf.example` | Приклади конфігурацій |
| `/etc/colibri/` | Каталог локальних конфігурацій адміністратора |
| `/usr/share/doc/colibri-git/` | Документація |

Реальний файл `coli` розташований у `/usr/lib/colibri/`, оскільки upstream визначає шляхи до рушіїв відносно розташування скрипта. Файли моделей до пакета не входять.

## Налаштування екземплярів

Каталог `/etc/colibri/` створює пакет. Робочі конфігурації моделей адміністратор створює окремо на основі прикладів:

```sh
install -m 600 /usr/share/colibri-git/qwen3-coder-30b.conf.example /etc/colibri/qwen3-coder-30b.conf
install -m 600 /usr/share/colibri-git/qwen36-35b.conf.example /etc/colibri/qwen36-35b.conf
```

| Екземпляр | Каталог моделі | Адреса | Порт |
| --- | --- | --- | --- |
| `qwen3-coder-30b` | `/var/lib/llama/models/colibri/qwen3-coder-30b` | `127.0.0.1` | `8091` |
| `qwen36-35b` | `/var/lib/llama/models/colibri/qwen36-35b` | `127.0.0.1` | `8090` |

Перед запуском перевірте наявність каталогу моделі, обсяг доступної RAM та параметри CPU/OpenMP. Ім'я екземпляра відповідає файлу `/etc/colibri/<екземпляр>.conf`. Для інших моделей створюйте окремі файли конфігурацій.

## Керування systemd

Приклад запуску Qwen3-Coder-30B:

```sh
systemctl enable --now colibri@qwen3-coder-30b.service
systemctl status colibri@qwen3-coder-30b.service
journalctl -u colibri@qwen3-coder-30b.service -f
```

Запуск Qwen3.6-35B:

```sh
systemctl enable --now colibri@qwen36-35b.service
```

Пакет не вмикає і не запускає служби автоматично. Шаблон наразі використовує `User=root` для сумісності з попередніми ручними запусками. Автоматичного обмеження одночасного запуску моделей за обсягом RAM немає.

Якщо існує локальний шаблон `/etc/systemd/system/colibri@.service`, він має пріоритет над `/usr/lib/systemd/system/colibri@.service` з пакета. Перевірте дієвий шаблон командою `systemctl cat colibri@qwen3-coder-30b.service` перед змінами локальних файлів.

## Перевірка API

За умови запущеної служби Qwen3-Coder:

```sh
curl -fsS http://127.0.0.1:8091/health
curl -fsS http://127.0.0.1:8091/v1/models
```

Адреса OpenAI-сумісного API для цього прикладу: `http://127.0.0.1:8091/v1`. Обидва приклади за замовчуванням приймають з'єднання лише з localhost.

## Зауваження

- Збирання налаштоване на CPU та `x86-64-v3`; точні параметри містить `PKGBUILD`.
- Каталоги моделей, кеші рушія й конфігурації `/etc/colibri/*.conf` не включені до пакета.
- Перед запуском служби зупиніть будь-який ручний процес, що використовує той самий порт.
- Шаблон systemd не усуває затримок обробки довгого промпту або проблем повторного використання KV-кешу.
