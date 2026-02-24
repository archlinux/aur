# `codex-app-electron-port-bin`

Bu klasör, Codex desktop uygulamasını macOS DMG üzerinden çıkarıp Arch Linux'ta sistem `electron` ile çalıştırmayı hedefleyen **AUR paketi dosyalarını** içerir.

## İçerik

- `PKGBUILD`: DMG indirir, `app.asar` çıkarır ve dosyaları `/opt` altına kurar
- `codex-app-electron-port-bin`: Uygulama launcher scripti
- `codex-app-electron-port-bin-rebuild-native`: `better-sqlite3` ve `node-pty` için native rebuild helper
- `codex-app-electron-port-bin.desktop`: Menü kısayolu
- `codex-app-electron-port-bin.install`: Kurulum sonrası yönlendirme mesajı

## Önemli Notlar

- Bu paket taslağı **resmi değildir**.
- İlk kurulumdan sonra native modüller rebuild edilmeden uygulama çalışmayabilir.
- DMG (`Codex.dmg`) checksum'u upstream dosya değişebildiği için taslakta `SKIP` bırakıldı. Yayınlamadan önce sabit checksum ile güncellemeniz önerilir.
- Upstream uygulama iç dizin yapısı değişirse `PKGBUILD` ve launcher scripti güncellenmelidir.
- Native rebuild helper, `/opt` altını güncellemek için gerektiğinde `sudo` kullanır.

## Yerel Test

```bash
cd /path/to/codex-app-electron-port-bin
makepkg -si
codex-app-electron-port-bin-rebuild-native
codex-app-electron-port-bin
```

## AUR Yayın Öncesi Önerilen Kontroller

- Temiz chroot veya temiz Arch kurulumunda `makepkg -si` testi
- `codex-app-electron-port-bin-rebuild-native` testi (sudo + pnpm approve-builds akışı)
- DMG için sabit checksum girme (mümkünse)
- Upstream lisans / kullanım koşullarını doğrulama
