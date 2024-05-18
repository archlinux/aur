# Maintainer: Klod Cripta <KlodCripta@linux.it>
pkgname=cleaner-advanced
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple system cleaning program for Arch Linux"
arch=('any')
url="https://github.com/KlodCripta/Cleaner-Advanced"
license=('MIT')
depends=('bash')
source=("https://github.com/KlodCripta/Cleaner-Advanced/raw/main/cleaner-advanced-1.0.0.tar.gz")
sha256sums=('2ca6ab0da74a7ef35d2eaa4cd40bc0a4ffaf05752d988f39ff42c58c0ed171fd')

prepare() {
    cd "$srcdir"
    tar -xvf cleaner-advanced-1.0.0.tar.gz
}

package() {
    cd "$srcdir/cleaner-advanced-1.0.0"
    install -Dm755 "cleaner_advanced.sh" "$pkgdir/usr/bin/cleaner_advanced"
    install -Dm644 "cleaner_advanced.desktop" "$pkgdir/usr/share/applications/cleaner_advanced.desktop"
    install -Dm644 "icons8-clean-48.png" "$pkgdir/usr/share/pixmaps/icons8-clean-48.png"
}
