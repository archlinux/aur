# Maintainer: Klod Cripta <KlodCripta@linux.it>
pkgname=deep-cleaner
pkgver=1.0.0
pkgrel=1
pkgdesc="A deeper system cleaning program for Arch Linux"
arch=('any')
url="https://github.com/KlodCripta/deep-cleaner"
license=('MIT')
depends=('bash')
source=("https://github.com/KlodCripta/deep-cleaner/raw/main/deep-cleaner-1.0.0.tar.gz")
sha256sums=('4b432049e671e603741fbce7ac0faee25c6e6e8130a322bfa6fde15d43d420a1')

prepare() {
    cd "$srcdir"
    tar -xvf deep-cleaner-1.0.0.tar.gz
}

package() {
    cd "$srcdir/deep-cleaner"
    install -Dm755 "deep-cleaner.sh" "$pkgdir/usr/bin/deep-cleaner"
    install -Dm644 "deep-cleaner.desktop" "$pkgdir/usr/share/applications/deep-cleaner.desktop"
    install -Dm644 "icon.png" "$pkgdir/usr/share/pixmaps/deep-cleaner.png"
}
