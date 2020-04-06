# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=otf-joscelyn
pkgdesc="Joscelyn, an authentic secretary hand (serif) font"
url='https://github.com/psb1558/Joscelyn-font'
license=('OFL')
pkgver=1.004
pkgrel=1
arch=('any')
source=("Joscelyn-${pkgver}.zip::https://github.com/psb1558/Joscelyn-font/releases/download/v${pkgver}/Joscelyn.zip")
sha256sums=('f00a5f26155a7138da91803a0f14a6340bdfea02109a0a8500227591fd0817e2')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "$srcdir/"*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/OFL.txt"
}
