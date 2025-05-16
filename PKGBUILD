# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=otf-joscelyn
pkgdesc="Joscelyn, an authentic secretary hand (serif) font"
url='https://github.com/psb1558/Joscelyn-font'
license=('OFL')
pkgver=1.020
pkgrel=1
arch=('any')
source=("Joscelyn-${pkgver}.zip::https://github.com/psb1558/Joscelyn-font/releases/download/v${pkgver}/joscelyn_${pkgver//./_}.zip")
sha256sums=('ec51b5cefc7f9273c2ff3fb44f22fb72a5a0e1733f198090c2c950c90c0f0ec2')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "$srcdir/Joscelyn/Joscelyn.otf"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/Joscelyn/OFL.txt"
}
