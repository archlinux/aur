# Maintainer: Felipe Morales <hel.sheep@gmail.com>
pkgname=acme-sac
pkgver=0.14
pkgrel=5
pkgdesc="Programmer's editor and shell, running over Inferno"
arch=('x86_64')
#arch=('i386')
url="http://code.google.com/p/acme-sac/"
license=('GPL')
depends=('lib32-libx11' 'lib32-libxext' 'gcc-multilib')
#depends=('gcc' 'libx11' 'libxext')
provides=('acme')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/acme-sac/acme-sac_0.14_i386.deb)
noextract=()
md5sums=(178477dd90abb650fd6b1f1babb3edf8)

package() {
	cd "$srcdir/"
	tar -xzf data.tar.gz
	mv usr/bin/acme usr/bin/acme-sac
	cp -r usr "$pkgdir/"
}
