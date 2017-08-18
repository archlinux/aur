# Maintainer: Leo Schwarz (evotopid) <mail@leoschwarz.com>
pkgname=kanjistrokeorders-ttf
pkgver=4.001
pkgrel=2
pkgdesc="Kanji stroke order font"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://www.nihilist.org.uk/"
source=("http://www.nihilist.org.uk/KanjiStrokeOrders_v${pkgver}.zip")
sha256sums=('b93212ef8bde171050294df2220355a2d9258362a1369c749175e7d4e177eb0d')
license=('BSD')


install=$pkgname.install

package() {
    install -D -m644 KanjiStrokeOrders_v${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/kanjistrokeorders.ttf"
    install -D -m644 copyright.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 *Sample.pdf readme*.txt "${pkgdir}/usr/share/doc/${pkgname}"
}
