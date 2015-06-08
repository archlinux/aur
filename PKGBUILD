# Contributor: Loui Chang <louipc dot ist at gmail dot com>
# Maintainer: mirandir <mirandir[at]orange[dot]fr>

pkgname=jumpnbump-levels
pkgver=1.0
pkgrel=3
pkgdesc="Additional levels for jump'n'bump."
url="http://icculus.org/jumpnbump"
license=('GPL')
depends=('jumpnbump')
optdepends=('jumpnbump-menu: a pygtk launcher for jumpnbump')
arch=('any')
source=('http://mirandir.pagesperso-orange.fr/files/additional-levels.tar.xz')
sha256sums=('7b4a647681cea9747700eec733d0db4cce9cdabd6200fef4443608e43582fc88')

package() {
	cd $srcdir/jumpnbump
	mkdir -p $pkgdir/usr/share/jumpnbump
	install -m 0644 -t $pkgdir/usr/share/jumpnbump/ *
}

