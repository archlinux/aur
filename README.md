# Bros Try

**Bros OS Virtual Machine Launcher** - Bros işletim sistemini kurulum gerektirmeden sanal makinede deneyin.

![Version](https://img.shields.io/badge/Version-1.0.0-pink)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-blue)
![License](https://img.shields.io/badge/License-Proprietary-red)

## Özellikler

- 🚀 **Tek Komutla Deneyim** - Bros OS'i tek komutla çalıştırın
- 💿 **Otomatik İndirme** - ISO dosyaları otomatik indirilir
- 🌐 **Ağ Desteği** - Önceden yapılandırılmış ağ ile test edin
- 📋 **Çoklu Versiyon** - v1.0.0'dan v1.2.2'ye kadar tüm versiyonlar
- 🎮 **QEMU** - Cross-platform sanal makine desteği

## Kurulum

### Linux (AUR)

```bash
yay -S bros-try
```

veya manuel kurulum:

```bash
git clone https://github.com/berkeoruc/bros.git
cd bros/bros-try
sudo cp bros-try /usr/bin/
sudo chmod +x /usr/bin/bros-try
```

### Windows (Winget)

```powershell
winget install BerkeOruc.BrosTry
```

veya manuel:

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

### macOS (Homebrew)

```bash
brew install qemu
curl -fsSL https://bros.berkeai.com/install/bros-try.sh | bash
```

## Kullanım

### Temel Kullanım

```bash
bros-try
```

Bu komut Bros OS v1.2.2'yi varsayılan ayarlarla (512MB RAM, 2 CPU) başlatır.

### Versiyon Seçimi

```bash
bros-try --version 1.1.0
bros-try --version 1.0.0
```

### Versiyon Listesi

```bash
bros-try --list
```

Çıktı:
```
Available Bros OS Versions:

  Version    Date         Status
  ------------------------------------------
  1.2.2      2026-04      ✓ Downloaded
  1.2.1      2026-03      ○ Not downloaded
  1.2.0      2026-02      ○ Not downloaded
  1.1.0      2026-01      ○ Not downloaded
  1.0.0      2025-12      ○ Not downloaded
```

### İndirme (Çalıştırmadan)

```bash
bros-try --download 1.2.0
```

### Özelleştirme

```bash
bros-try --memory 1024M   # 1GB RAM
bros-try --cpu 4           # 4 CPU çekirdeği
bros-try --display sdl    # SDL ekran
bros-try --no-network     # Ağsız çalıştır
```

### Temizlik

```bash
bros-try --clean
```

İndirilen ISO dosyalarını temizler.

## Sistem Gereksinimleri

| Bileşen | Minimum | Önerilen |
|---------|---------|----------|
| RAM | 512MB | 1GB |
| Disk | 100MB | 500MB |
| CPU | 1 core | 2+ cores |
| QEMU | Latest | Latest |

### QEMU Kurulumu

```bash
# Arch Linux
sudo pacman -S qemu

# Ubuntu/Debian
sudo apt install qemu-system-x86

# macOS
brew install qemu

# Windows
choco install qemu
```

## Ekran Görüntüleri

```
    ██╗     ██╗   ██╗███╗   ███╗██╗███╗   ██╗ █████╗ 
    ██║     ██║   ██║████╗ ████║██║████╗  ██║██╔══██╗
    ██║     ██║   ██║██╔████╔██║██║██╔██╗ ██║███████║
    ██║     ██║   ██║██║╚██╔╝██║██║██║╚██╗██║██╔══██║
    ███████╗╚██████╔╝██║ ╚═╝ ██║██║██║ ╚████║██║  ██║
    ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝
```

## Bros OS Hakkında

Bros OS, Rust ile sıfırdan geliştirilen x86_64 server işletim sistemidir:

- **Çekirdek**: no_std Rust monolithic kernel
- **Dosya Sistemi**: DefneFS (özel)
- **Ağ**: Tam TCP/IP stack (TCP, UDP, ICMP, ARP)
- **Shell**: Brosh (50+ komut)
- **Kullanıcı Yönetimi**: Tam kimlik doğrulama sistemi

Daha fazla bilgi: [bros.berkeai.com](https://bros.berkeai.com)

## Lisans

Bu yazılım tescillidir. Kullanım için lisans şartları geçerlidir.

**© 2024-2026 Berke Oruc. Tüm hakları saklıdır.**

## İletişim

- Email: berke3oruc@gmail.com
- GitHub: https://github.com/berkeoruc/bros

## Katkı

Hata bildirimi ve öneriler için GitHub Issues kullanabilirsiniz.
