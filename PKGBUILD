# Maintainer: ber532k <ber532k@gmx.de>
pkgname=vokabeltrainer-git
_pkgname=vokabeltrainer
pkgver=`date +%Y_%m_%d`
pkgrel=2
pkgdesc="A small command-line vocable trainer that uses the Leitner box system."
license=('custom:MIT')
arch=('any')
url="https://github.com/rusio/VokabelTrainer"
depends=('groovy')
makedepends=('git')
source=("$pkgname::git+https://github.com/rusio/VokabelTrainer")
md5sums=('SKIP')

package() {
	mkdir -p $pkgdir/usr/bin
	install -m755 $pkgname/vokabeltrainer.groovy $pkgdir/usr/bin/vokabeltrainer
	mkdir -p $pkgdir/usr/share/licenses/vokabeltrainer
	install -m644 $pkgname/LICENSE.md $pkgdir/usr/share/licenses/vokabeltrainer/
}
