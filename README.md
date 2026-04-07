# Serpent 🐍🐉
**Serpent**, modern ve yüksek performanslı bir sistem programlama dilidir. Wayland native GUI yeteneklerine, entegre HTTP ağ desteğine ve düşük seviyeli bytecode VM yapısına sahiptir. Serpent, performansı modern masaüstü teknolojileriyle birleştirmeyi hedefler.

## 🚀 Öne Çıkan Özellikler
- **Wayland Native GUI**: X11 bağımlılığı olmadan, doğrudan Wayland üzerinde çalışan pürüzsüz grafikler ve interaktif bileşenler (Butonlar, Metin Kutuları).
- **Entegre HTTP Desteği**: `libcurl` tabanlı senkron/eşzamanlı ağ işlemleriyle doğrudan web API entegrasyonu.
- **Bytecode Sanal Makine (VM)**: C hızında çalışan, hafif ve güçlü bir çalışma zamanı (VM).
- **Interaktif Girdi**: Gelişmiş fare ve klavye takibi (`xkbcommon` desteği ile).
- **Hafif ve Taşınabilir**: Minimum sistem bağımlılığı, maksimum performans.

## 🛠️ Kurulum (Arch Linux)
Serpent'i Arch Linux üzerinde AUR paketini kullanarak kolayca kurabilirsiniz:

```bash
git clone https://aur.archlinux.org/serpent-git.git
cd serpent-git
makepkg -si
```

Veya manuel olarak derlemek için:
```bash
make
./serpent your_script.serpent
```

## 📝 Örnek Kullanım (Ağ + GUI)
Serpent ile bir butona tıklandığında internete veri gönderen basit bir uygulama:

```serpent
var win = wl_create(800, 600, "Serpent Proje");
var mesaj = "Selam Serpent!";

while (wl_poll(win)) {
    wl_draw_rect(win, 0, 0, 800, 600, 0x121212); // Arka plan
    
    mesaj = wl_textbox(win, 50, 50, 300, 40, mesaj, 1);
    
    if (wl_button(win, 50, 100, 150, 40, "GÖNDER")) {
        print "Veri internete gönderiliyor...";
        http_post("https://api.site.com/data", mesaj);
    }
    
    wl_commit(win);
}
```

## 📦 Bağımlılıklar
- `wayland-client`
- `curl`
- `libxkbcommon`
- `wayland-protocols` (Derleme aşaması için)

## ⚖️ Lisans
MIT License - © 2026 Serpent Team
