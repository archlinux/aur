# Maintainer: Aria Moradi <aria.moradi007@gmail.com>
# Contibutor: impostersussy <amogus.sussy@fedora.email>

pkgname=otf-helvetica-now
pkgver=1.0
pkgrel=1
pkgdesc="Helvetica Now font"
arch=('any')
url="https://github.com/impostersussy/HelveticaNow"
license=('custom')
makedepends=('git')
provides=("${pkgname}")
source=("git+https://github.com/impostersussy/HelveticaNow.git"
	"LICENSE")
sha256sums=('SKIP'
	'4f287da2055d1b0f7094c0ce34cb1f8a29e8cd3b788bb79ef3a8c6352bbaeee0')
package() {
    find . -iname "*.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
    install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
