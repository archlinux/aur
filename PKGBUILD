# Maintainer: Leo Schwarz (evotopid) <mail@leoschwarz.com>
pkgname=kanjistrokeorders-ttf
pkgver=4.000
pkgrel=1
pkgdesc="Kanji stroke order font"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://www.nihilist.org.uk/"
source=("http://www.nihilist.org.uk/KanjiStrokeOrders_v4.000.zip")
sha256sums=('192064dcd9e1c91fdd8de7d92dafa755297dfe256c11f068152dd702c89917eb')
license=('BSD')


install=$pkgname.install

package() {
    install -D -m644 KanjiStrokeOrders_v4.000.ttf "${pkgdir}/usr/share/fonts/TTF/kanjistrokeorders.ttf"
    install -D -m644 copyright.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
