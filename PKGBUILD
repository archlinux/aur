# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>
pkgname=sapphire-butler
pkgver=0.5
pkgrel=0
pkgdesc="An extensible task executor that aims to make certain tasks easy and user friendly."
arch=(any)
license=('GPL3')
url='https://codeberg.org/Sapphire/sapphire-butler'
depends=('yad' 'bash' 'perl' 'xdg-utils' 'pikaur')
source=("https://codeberg.org/Sapphire/sapphire-butler/archive/${pkgver}.tar.gz")
sha256sums=("179406b93c11cfd489037f05feeeafec560bb5cb747ba9b40421fade4b10c446")

package() {
	cd "$srcdir/sapphire-butler"
	mkdir -p ${pkgdir}/usr/share/licenses/sapphire-butler/
	cp LICENSE ${pkgdir}/usr/share/licenses/sapphire-butler/
	#mkdir -p ${pkgdir}/usr/bin # This can be removed once I add it to the makefile in the next release. This will do, for now.
	make install PREFIX=${pkgdir}
}	
