# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=otf-joscelyn
pkgdesc="Joscelyn, an authentic secretary hand (serif) font"
url='https://github.com/psb1558/Joscelyn-font'
license=('OFL')
pkgver=1.012
pkgrel=1
arch=('any')
source=("Joscelyn-${pkgver}.zip::https://github.com/psb1558/Joscelyn-font/releases/download/v${pkgver}/Joscelyn.zip")
sha256sums=('2b08726b44545f70eac318105cb464536f8d7c28b80d219569d073271f8cddd1')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "$srcdir/"*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/OFL.txt"
}
