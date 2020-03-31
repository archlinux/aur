# Maintainer: Korbinian Schildmann <aur@schildmann.net>

pkgbase=freeman-korbi-bin
pkgname=(freeman-korbi-bin)
pkgver=0.2.178
pkgrel=1
pkgdesc="freeman"
makedepends=('git' 'tar')
arch=('any')
license=('GPL3')
options=(!strip)
source=("http://git.int.schildmann.net/kschildmann/freeman/uploads/6d32dca04128e717785d9bda8ed227cf/freeman.tar.gz")
sha256sums=('c480ab55dd8ede515d11bdd96f77a03b91884c95dd8c6614046e7d4ad70671da')

package() {
	tar -xvf freeman.tar.gz -C "$pkgdir"

	mkdir -p $pkgdir/usr/bin/
	install -m 755 $pkgdir/freeman $pkgdir/usr/bin/freeman
}
