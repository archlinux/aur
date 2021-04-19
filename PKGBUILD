# Maintainer:  Matthew Hiles <matthew.hiles@gmail.com>
# Contributor: Jeffrey David Johnson <jefdaj@gmail.com>
 
pkgname=sdx
pkgver=20110317
pkgrel=1
pkgdesc="A utility for making and unpacking starkits."
url="http://equi4.com/starkit/sdx.html"
depends=(tclkit)
arch=(any)
license=("MIT")
options=(!strip)
source=(http://chiselapp.com/user/aspect/repository/sdx/raw/sdx-20110317.kit?name=1a77b0b5bc8cfcf2df2ef051a511e9187103ce0c)
md5sums=('f27d8f331899d97202fde25e7c39f55e')                                                                                

package() {
	mkdir -p "$pkgdir"/usr/bin
	mv sdx*.kit* sdx.kit
	install -o root -g root sdx.kit "$pkgdir"/usr/bin/sdx.kit
	chmod ugo+x "$pkgdir"/usr/bin/sdx.kit
}