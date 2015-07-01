# Maintainer:  Matthew Hiles <matthew.hiles@gmail.com>
# Contributor: Jeffrey David Johnson <jefdaj@gmail.com>
 
pkgname=sdx
pkgver=20080224
pkgrel=4
pkgdesc="A utility for making and unpacking starkits."
url="http://equi4.com/starkit/sdx.html"
depends=(tclkit)
arch=(any)
license="MIT"
options=(!strip)
source=(http://equi4.com/pub/sk/sdx.kit)
md5sums=('f11522239e4f30e20ebda62282b3f34a')
 
package() {
	mkdir -p "$pkgdir"/usr/bin
	install -o root -g root sdx.kit "$pkgdir"/usr/bin/sdx.kit
	chmod ugo+x "$pkgdir"/usr/bin/sdx.kit
}