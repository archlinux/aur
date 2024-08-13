pkgname=termusix-bin
 pkgdesc="A terminal-based music player with a user-friendly terminal UI, built with Rust."
 pkgrel=1
 pkgver=0.1.0
 url="https://github.com/sumoduduk/termusix"
 license=("GPL-3.0")
 arch=("x86_64")
 provides=("termusix")
 conflicts=("termusix")
 depends=("alsa-lib" "dbus")
 source=("https://github.com/sumoduduk/termusix/releases/download/v$pkgver/termusix-$CARCH-linux")
 sha256sums=("3753aa26c81fdb3a8e645a653cad90394cd714517f2e261d4b34013b35cd5a7f")

 package() {
    mv termusix-x86_64-linux termusix
    install -Dm755 termusix -t "$pkgdir/usr/bin"
 }

