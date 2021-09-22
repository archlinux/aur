# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>
pkgname=sapphire-butler
pkgver=0.3
pkgrel=0
pkgdesc="An extensible task executor that aims to make certain tasks easy and user friendly."
arch=(any)
license=('GPL3')
url='https://codeberg.org/Sapphire/sapphire-butler'
depends=('yad' 'bash' 'perl' 'xdg-utils')
source=("https://codeberg.org/Sapphire/sapphire-butler/archive/${pkgver}.tar.gz")
sha256sums=("d1700e95774803b029b5c95416193d8a2d26ac78d93f14d8f977b9bc2be46703")

package() {
	cd "$srcdir/sapphire-butler"
	mkdir -p ${pkgdir}/usr/share/licenses/sapphire-butler/
	cp LICENSE ${pkgdir}/usr/share/licenses/sapphire-butler/
	#mkdir -p ${pkgdir}/usr/bin # This can be removed once I add it to the makefile in the next release. This will do, for now.
	make install PREFIX=${pkgdir}
}	
