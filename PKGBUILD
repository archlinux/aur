# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=ttf-kepatihanpro
# There is no versioning of this font. It was dumped onto a website in 2000
pkgver=20000217
pkgrel=1
pkgdesc='A font for symbols frequently used in the notation of gamelan music'
url="http://www.gamelan.org/library/"
license=('custom')
arch=('any')
source=("$pkgname-$pkgver.zip::http://www.gamelan.org/library/fonts/kepatprowin.zip")
sha256sums=('642377944e34730b3afd28b9a87bd0da631634853d2aa83205606c1eaebe2e52')

package() {
    install -Dm644 KEPAP___.TTF "$pkgdir/usr/share/fonts/TTF/KepatihanPro.ttf"
    install -Dm644 KepatihanNotes.pdf -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "KepatihanPro Keycaps.pdf" -t "$pkgdir/usr/share/doc/$pkgname/"
}
