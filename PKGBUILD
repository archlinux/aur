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
source=("http://git.int.schildmann.net/kschildmann/freeman/uploads/063facf4e5614f488554d3cc5ed898ad/freeman.tar.gz")
sha256sums=('9e604a788fd408a920ac799667bd9fa703adf15c08fd63fdc57e9c7440a11288')

package() {
	tar -xvf freeman.tar.gz -C "$pkgdir"

	mkdir -p $pkgdir/usr/bin/
	install -m 755 $pkgdir/freeman $pkgdir/usr/bin/freeman
}
