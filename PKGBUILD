# Maintainer: Felipe Morales <hel.sheep@gmail.com>
pkgname=acme-sac
pkgver=0.14
pkgrel=2
pkgdesc="Programmer's editor and shell, running over Inferno"
arch=('any')
url="http://code.google.com/p/acme-sac/"
license=('GPL')
depends=()
provides=('acme')
source=(http://acme-sac.googlecode.com/files/acme-sac_0.14_i386.deb)
noextract=()
md5sums=(178477dd90abb650fd6b1f1babb3edf8) 

package() {
	cd "$srcdir/"
	tar -xzf data.tar.gz
	cp -r usr "$pkgdir/"
}
