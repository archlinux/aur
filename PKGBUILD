# Maintainer: Aria Moradi <aria.moradi007@gmail.com>
# Contributor: impostersussy <amogus.sussy@fedora.email>

pkgname=otf-helvetica-neue
pkgver=1.0
pkgrel=1
pkgdesc="Helvetica Neue font"
arch=('any')
url="https://github.com/impostersussy/HelveticaNeue"
license=('custom')
makedepends=('git')
provides=("${pkgname}")
source=("git+https://github.com/impostersussy/HelveticaNeue.git"
	"LICENSE")
sha256sums=('SKIP'
	'c9e0c08c58f3edbaa5c1a6a9f1e45a8dabc976d54c540bfef3f51eda9e26ceb5')

package() {
    find . -iname "*.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
    install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
