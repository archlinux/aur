# Contributor: Jose Negron <josenj.arch@mailnull.com>
# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=flip
pkgver=20130224
pkgrel=4
pkgdesc="Utility program to convert text files between UNIX or Mac newlines and DOS linefeed + newlines."
arch=('i686' 'x86_64')
url="http://ccrma.stanford.edu/~craig/utility/flip/"
license=('unknown')
source=("http://ccrma.stanford.edu/~craig/utility/flip/${pkgname}.cpp")
md5sums=('21dc9256584eceffcfc27e137b3f8bc5')

build() {
	cd ${srcdir}
	g++ ${CXXFLAGS} flip.cpp -o flip
}

package(){
	mkdir -p ${pkgdir}/usr/bin
	install -m755 flip ${pkgdir}/usr/bin
}
