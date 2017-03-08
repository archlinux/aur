# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: libernux <dutchman55@gmx.com>
pkgname=arss-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="program that analyses a sound file into a spectrogram and is able to synthesise this spectrogram, or any other user-created image, back into a sound"
arch=('any')
url="http://arss.sourceforge.net/index.shtml"
license=('GPL')
optdepends=('audacity' 'gimp')
source=("https://netcologne.dl.sourceforge.net/project/arss/arss/0.2.3/arss-0.2.3-linux-binary.tar.gz")
sha384sums=('4f532bc89d648b7a8a88bd4eb3338041842f1105e551cb5ef7cbcca6f523047c12909edd4d87a064ea864676674d6256')
sha512sums=('551d828497c96ab79e5692477f7f6f77884310ed1fa012dbd750aec0ee37495008caefad74e41d80e2108001c4862730ded38efc89aa9ec46eb4fdede8f5acc3')

package() {
	tar zxf arss-0.2.3-linux-binary.tar.gz
	cd "$srcdir"
	mkdir -p "${pkgdir}/usr/bin"
	cp arss ${pkgdir}/usr/bin/arss
	
}