# 🐱 koteyfetch

**koteyfetch** — красивая системная утилита с милым котиком для отображения информации о вашей Linux системе!

```
    ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦

       /\_/\  
      ( o.o ) 
       > ^ <  

    ♦ koteyfetch ♦

    ● User      → koteykin@cachy
    ● OS        → CachyOS Linux x86_64
    ● Kernel    → Linux 6.16.0-2-cachyos
    ● Uptime    → 1d 3h 24m
    ● Shell     → fish 3.6.0
    ● Terminal  → alacritty 0.13.0
    ● CPU       → Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz (6) @ 4.10 GHz
    ● GPU       → NVIDIA GeForce GT 730 [Discrete]
    ● Memory    → (9 GB / 16 GB) [59%]
    ● Swap      → (0 B / 16 GB) [0%]
    ● Disk      → (48 GB / 457 GB) [10%] - ext4
    ● Local IP  → 192.168.0.7/24
    ● Public IP → 0.0.0.0

    ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦ ◦
```

## ✨ Особенности

- 🎨 **Настраиваемые цвета** — полная кастомизация цветовой схемы
- 🔧 **Модульная система** — включайте/выключайте нужную информацию
- 🐱 **Милый ASCII кот** — украшает вывод системной информации
- 📊 **Подробная информация** — CPU, GPU, память, диски, сеть и многое другое
- ⚡ **Быстрая работа** — написано на C++ для максимальной производительности
- 🎯 **Автоматическая настройка** — создание конфига при первом запуске

## 🚀 Установка

### Arch Linux (AUR)
```bash
# Клонируем репозиторий
git clone https://github.com/NotZepka/koteyfetch.git
cd koteyfetch

# Собираем пакет
makepkg -si
```

### Ручная установка
```bash
# Клонируем репозиторий
git clone https://github.com/NotZepka/koteyfetch.git
cd koteyfetch

# Компилируем
g++ -std=c++11 -O2 -o koteyfetch koteyfetch.cpp

# Устанавливаем (опционально)
sudo cp koteyfetch /usr/local/bin/
```

## 🎯 Использование

Просто запустите:
```bash
koteyfetch
```

При первом запуске автоматически создается файл конфигурации в `~/.config/koteyfetch/config.jsonc`.

## ⚙️ Настройка

### Файл конфигурации

Откройте `~/.config/koteyfetch/config.jsonc` в любом текстовом редакторе:

```bash
nano ~/.config/koteyfetch/config.jsonc
```

### Настройка цветов

```jsonc
"colors": {
  "cat": "cyan",           // Цвет ASCII кота
  "title": "magenta",      // Цвет заголовка koteyfetch
  "separator": "white",    // Цвет разделителей
  "labels": "yellow",      // Цвет меток (User, OS, etc.)
  "values": "white",       // Цвет значений
  "arrows": "bright_blue", // Цвет стрелок →
  "decorations": "bright_black" // Цвет декоративных точек
}
```

#### Доступные цвета:
- **Обычные**: `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`
- **Яркие**: `bright_black`, `bright_red`, `bright_green`, `bright_yellow`, `bright_blue`, `bright_magenta`, `bright_cyan`, `bright_white`
- **Стили**: `bold`

### Настройка модулей

```jsonc
"modules": {
  "user": true,      // Пользователь@хост
  "os": true,        // Операционная система
  "kernel": true,    // Версия ядра
  "uptime": true,    // Время работы системы
  "shell": true,     // Оболочка и версия
  "terminal": true,  // Терминал и версия
  "cpu": true,       // Информация о процессоре
  "gpu": true,       // Информация о видеокарте
  "memory": true,    // Использование памяти
  "swap": true,      // Использование swap
  "disk": true,      // Использование диска
  "local_ip": true,  // Локальный IP адрес
  "public_ip": true  // Публичный IP адрес
}
```

## 📋 Зависимости

### Обязательные:
- `gcc` (для компиляции)
- `gcc-libs` (для выполнения)

### Опциональные:
- `pciutils` (lspci) — для получения информации о GPU
- `curl` — для получения публичного IP адреса

## 🔍 Поддерживаемая информация

- **User** — имя пользователя и hostname
- **OS** — название дистрибутива и архитектура
- **Kernel** — версия ядра Linux
- **Uptime** — время работы системы
- **Shell** — используемая оболочка и её версия
- **Terminal** — терминал и его версия
- **CPU** — модель процессора, количество ядер и частота
- **GPU** — модель видеокарты (дискретная/интегрированная)
- **Memory** — использование оперативной памяти с процентами
- **Swap** — использование файла подкачки
- **Disk** — использование корневой файловой системы и её тип
- **Local IP** — локальный IP адрес с CIDR маской
- **Public IP** — внешний IP адрес

## 🎨 Примеры настроек

### Минималистичная тема
```jsonc
"colors": {
  "cat": "white",
  "title": "white",
  "labels": "bright_black",
  "values": "white",
  "arrows": "bright_black",
  "decorations": "bright_black"
}
```

### Яркая тема
```jsonc
"colors": {
  "cat": "bright_cyan",
  "title": "bright_magenta",
  "labels": "bright_yellow",
  "values": "bright_white",
  "arrows": "bright_blue",
  "decorations": "bright_green"
}
```

### Только основная информация
```jsonc
"modules": {
  "user": true,
  "os": true,
  "kernel": true,
  "uptime": true,
  "shell": false,
  "terminal": false,
  "cpu": true,
  "gpu": false,
  "memory": true,
  "swap": false,
  "disk": true,
  "local_ip": false,
  "public_ip": false
}
```

## 🤝 Вклад в проект

Приветствуются любые улучшения! Если у вас есть идеи или вы нашли баги:

1. Форкните репозиторий
2. Создайте ветку для новой функции (`git checkout -b feature/amazing-feature`)
3. Закоммитьте изменения (`git commit -m 'Add some amazing feature'`)
4. Запушьте в ветку (`git push origin feature/amazing-feature`)
5. Откройте Pull Request

## 📝 Лицензия

Этот проект распространяется под лицензией MIT. Подробности в файле [LICENSE](LICENSE).

## 🐱 Почему koteyfetch?

Потому что коты делают всё лучше! Этот проект создан для тех, кто любит милых котиков и красивый вывод системной информации.

---

**Сделано с ❤️ и 🐱 от [dozaxcx](https://github.com/NotZepka)**
