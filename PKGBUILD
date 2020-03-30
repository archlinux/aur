# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=otf-joscelyn
pkgdesc="Joscelyn, an authentic secretary hand (serif) font"
url='https://github.com/psb1558/Joscelyn-font'
license=('custom:SIL Open Font License')
pkgver=1.001
pkgrel=1
arch=('any')
source=("https://github.com/psb1558/Joscelyn-font/releases/download/v${pkgver}/Joscelyn.zip")
sha256sums=('b1d290dff9ed27fa5d4b896e8791fab267bba3f555666c87d5b20b3b08b2928e')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "$srcdir/"*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/OFL.txt"
}
