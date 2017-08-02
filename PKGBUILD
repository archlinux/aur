# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Contributor: larsrh <hupel@in.tum.de>

pkgname=gcc-gcj-ecj
pkgver=4.9
pkgrel=4
pkgdesc="A fork of the Eclipse Java bytecode compiler for GCJ"
depends=('gcc6-gcj')
provides=('eclipse-ecj')
conflicts=('eclipse-ecj')
arch=('any')
license=('EPL')
url="http://gcc.gnu.org/java/"
source=(http://mirrors.kernel.org/sources.redhat.com/java/ecj-${pkgver}.jar ecj1)
noextract=("ecj-${pkgver}.jar")

package() {
	install -D -m644 $srcdir/ecj-${pkgver}.jar $pkgdir/usr/share/java/eclipse-ecj.jar
	install -D -m755 $srcdir/ecj1 $pkgdir/usr/bin/ecj1
}
md5sums=('7339f199ba11c941890031fd9981d7be'
         'ee312c2f80c73152dde859ea66e494d0')
