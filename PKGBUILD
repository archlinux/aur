pkgname=reorgfolder-bin
 pkgdesc="Blazingly fast and safe utility written in Rust for reorganizing folders by grouping files based on their extensions."
 pkgrel=1
 pkgver=0.1.0
 url="https://github.com/sumoduduk/reorgfolder"
 license=("GPL-3.0")
 arch=("x86_64")
 provides=("reorgfolder")
 conflicts=("reorgfolder")
 source=("https://github.com/sumoduduk/reorgfolder/releases/download/v$pkgver/reorgfolder-$CARCH-linux")
 sha256sums=("6abb4acb634a9df8b72af4df05a484750a2db89d9a8bf9ff3031deb5d228b2cc")

 package() {
    mv reorgfolder-x86_64-linux reorgfolder
    install -Dm755 reorgfolder -t "$pkgdir/usr/bin"
 }

