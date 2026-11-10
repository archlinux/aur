# colibri-git для Arch Linux / Snug Linux

Виправлено розміщення внутрішніх компонентів:

- `/usr/bin/coli` — символічне посилання на `../lib/colibri/coli`;
- `/usr/lib/colibri/coli` — справжній Python-скрипт запуску;
- `/usr/lib/colibri/qwen36` та інші рушії — скомпільовані CPU-бінарники;
- `/usr/lib/colibri/*.py`, `tools/`, `web/dist/` — службові модулі та вебпанель.

Це важливо: upstream-скрипт використовує `os.path.realpath(__file__)` і знаходить
інші компоненти поруч зі справжнім файлом. Тому просто перенести рушії до
`/usr/lib/colibri` і залишити звичайний скрипт у `/usr/bin` було б неправильно.

## Збірка (на llm-node01 від користувача kh, не root)

```bash
sudo pacman -S --needed base-devel git python nodejs npm
mkdir -p ~/builds/colibri-git
cd ~/builds/colibri-git
# Поклади сюди PKGBUILD із цього архіву
makepkg -s --cleanbuild --log
```

Пакет залишається НЕ встановленим після `makepkg`. Встановлення конфліктує з
`colibri-bin`, тому спершу зупини Colibri, перевір резервну копію налаштувань
і тільки тоді окремо встановлюй зібраний пакет через `pacman -U`.

## Перевірка вмісту перед встановленням

```bash
pacman -Qlp ./colibri-git-*.pkg.tar.zst | grep -E '/(bin/coli|lib/colibri/(coli|qwen36|family_registry.py|web/dist/index.html))$'
```

Збережені моделі `/var/lib/llama/models/colibri` і конфігурація
`/root/.local/share/colibri` не включаються до цього пакета.

## Обмеження

- Код береться з рухомої гілки `main` — зафіксуй коміт `git` для відтворюваності.
- Налаштування компіляції — CPU-only `ARCH=x86-64-v3`, що підходить для Ryzen 7950X.
- Збірку `makepkg` на твоєму сервері ще не виконували, тому можливі зміни upstream
  у залежностях або цілях збірки.
- Пакет підміняє `colibri-bin` лише ПІСЛЯ явного встановлення; автоматичного
  перенесення чи зміни налаштувань сервісу не виконує.

## Універсальні systemd-сервіси (додано у pkgrel=2)

Пакет постачає `/usr/lib/systemd/system/colibri@.service` і
`/usr/lib/colibri/colibri-instance`. Конфігурації користувача мають бути
у `/etc/colibri/<instance>.conf` і **не входять до пакета**: це дозволяє
оновлювати пакет без перезапису налаштувань.

Приклади лежать у `/usr/share/doc/colibri-git/*.conf.example`.
Вони не вмикають автозапуск самі по собі.

### Налаштування Qwen3-Coder на 8091

Виконай на `llm-node01` від root після встановлення пакета:

```bash
install -d -m 755 /etc/colibri
install -m 600 /usr/share/doc/colibri-git/qwen3-coder-30b.conf.example /etc/colibri/qwen3-coder-30b.conf
# Поки працює фоновий coli start на 8091, не запускай systemd-сервіс.
coli stop
ss -ltnp | grep ':8091' || true
systemctl daemon-reload
systemctl enable --now colibri@qwen3-coder-30b.service
systemctl status colibri@qwen3-coder-30b.service --no-pager
curl -fsS http://127.0.0.1:8091/health
```

**Важливо:** `coli stop` зупиняє екземпляр, зареєстрований у поточному
`coli setup`, тому перед виконанням перевір, що це саме модель на 8091.
Не запускай два процеси на одному порту.

### Додавання іншої моделі

Скопіюй відповідний приклад до `/etc/colibri/назва.conf`, зміни
`COLI_MODEL` (реальний каталог моделі), `COLI_PORT` і за потреби CPU-параметри.
Потім виконай `systemctl enable --now colibri@назва.service`.

Приклад `qwen36.conf.example` містить **неперевірений шлях** до моделі;
перед запуском його потрібно уточнити. Кілька важких моделей одночасно
можуть перевищити обсяг RAM. Цей шаблон **не** забезпечує автоматичного
взаємного виключення.

### Конфлікт ручного шаблону

Якщо раніше вручну створено `/etc/systemd/system/colibri@.service`, він має
пріоритет над пакунковим `/usr/lib/systemd/system/colibri@.service`.
Порівняй файли командою `systemctl cat colibri@qwen3-coder-30b.service`,
створи резервну копію ручного файлу й тільки після цього прибирай його.

### Перевірка вмісту зібраного пакета

```bash
pacman -Qlp ./colibri-git-*.pkg.tar.zst | grep -E 'colibri@\.service|colibri-instance|\.conf\.example|README-uk.md'
```

### Зауваження

- Шаблон запускає процес як root для сумісності з попереднім ручним запуском; можна обмежити права окремим доопрацюванням.
- Параметри `COLI_*` передаються в `coli web`, `OMP_*` і налаштування рушія успадковуються через середовище.
- `--auto-tier` визначає розміщення моделі в RAM; systemd не гарантує миттєвий запуск.
- Сервіс не змінює механіку prefill або довгий системний промпт Open WebUI.
