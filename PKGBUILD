# Maintainer: Leo Schwarz (evotopid) <mail@leoschwarz.com>
pkgname=kanjistrokeorders-ttf
pkgver=4.002
pkgrel=1
pkgdesc="Kanji stroke order font"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://www.nihilist.org.uk/"
source=("http://www.nihilist.org.uk/KanjiStrokeOrders_v${pkgver}.zip")
sha256sums=('66ef5987dd64474e6c638f020fdb6fbe10db4b58f1420e32b22b320d2407f5cb')
license=('BSD')


install=$pkgname.install

package() {
    install -D -m644 KanjiStrokeOrders_v${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/kanjistrokeorders.ttf"
    install -D -m644 copyright.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 *Sample.pdf readme*.txt "${pkgdir}/usr/share/doc/${pkgname}"
}
