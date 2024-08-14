pkgname=termusix-bin
 pkgdesc="A terminal-based music player with a user-friendly terminal UI, built with Rust."
 pkgrel=1
 pkgver=0.1.1
 url="https://github.com/sumoduduk/termusix"
 license=("GPL-3.0")
 arch=("x86_64")
 provides=("termusix")
 conflicts=("termusix")
 depends=("alsa-lib" "dbus")
 source=("https://github.com/sumoduduk/termusix/releases/download/v$pkgver/termusix-$CARCH-linux")
 sha256sums=("840843a738efecc5e17debe02801a69edf16a77ee614c04dc866e84f22c4260c")

 package() {
    mv termusix-x86_64-linux termusix
    install -Dm755 termusix -t "$pkgdir/usr/bin"
 }

