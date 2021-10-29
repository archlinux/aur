# Maintainer: impostersussy <amogus.sussy@fedora.email>
pkgname=pragmata-pro
pkgver=0.829
pkgrel=1
pkgdesc="Pragmata Pro font"
arch=('any')
url="https://github.com/impostersussy/PragmataPro"
license=('custom')
makedepends=('git')
provides=("${pkgname}")
source=("git+https://github.com/impostersussy/PragmataPro.git"
	"LICENSE")
sha256sums=('SKIP'
	'b70524967fb5a4dbf03ae23115b6d46b88f3b42f296339d12fe322d6ca2c78fe')
package() {
    find . -iname "*.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
    install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
