# yt

========================================

## 🇹🇷 Türkçe

yt, PAM tabanlı, minimal ve güvenli bir yetki yükseltme aracıdır.

sudo, doas veya su bağımlılığı olmadan çalışır.
Şifre girişi gizlidir ve güvenlidir.

### Özellikler

- PAM ile kimlik doğrulama
- sudo / su bağımlılığı yok
- Şifre terminalde görünmez
- onepass / nopass / pass desteği
- Yapılandırma dosyası sadece root tarafından düzenlenebilir

### Kurulum

AUR üzerinden:


yay -S ekipyt


Manuel kurulum:


makepkg -si


### Yapılandırma

Dosya yolu:


/etc/yt.cfg

Format:

kullanici:mod


Modlar:

- nopass  → Şifre sormaz
- pass    → Her seferinde sorar
- onepass → Oturumda bir kez sorar

Örnek:


:onepass


### Kullanım


yt <komut>

Örnek:


yt pacman -Syu


### Lisans

MIT License

========================================

## 🇬🇧 English

yt is a minimal and secure privilege escalation tool based on PAM.

It works without sudo or su dependency.
Password input is hidden and secure.

### Features

- PAM based authentication
- No sudo / su dependency
- Hidden password input
- onepass / nopass / pass support
- Root-only configuration file

### Installation

From AUR:


yay -S ekipyt


Manual install:


makepkg -si


### Configuration

File path:

/etc/yt.cfg


Format:


user:mode

Modes:

- nopass  → No password required
- pass    → Ask every time
- onepass → Ask once per session

Example:

### Usage

yt <command>

Example:

yt pacman -Syu

### License

MIT License

========================================

## 🇨🇳 中文（请阅读）

yt 是一个基于 PAM 的最小化、安全的权限提升工具。

无需 sudo 或 su 依赖。
密码输入是隐藏且安全的。

### 功能

- 基于 PAM 的身份验证
- 无 sudo / su 依赖
- 隐藏密码输入
- 支持 onepass / nopass / pass
- 仅 root 可编辑配置文件

### 安装

从 AUR 安装：


yay -S ekipyt


手动安装：


makepkg -si


### 配置

配置文件路径：


/etc/yt.cfg


格式：


用户名:模式

模式：

- nopass  → 不需要密码
- pass    → 每次询问密码
- onepass → 每个会话询问一次

### 使用方法


yt <命令>

示例：


yt pacman -Syu


### 许可证

MIT License

========================================

Yayımcı (Author): Yalçın Mete Kızılgün  
Yıl (Year): 2026
