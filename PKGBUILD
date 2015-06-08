# Maintainer: Shanto <shanto@hotmail.com>
# Maintainer: Jonathan Wiersma <archaur at jonw dot org>
pkgname=eclipse-dtp
pkgver=1.12.0
pkgrel=1
pkgdesc="Data Tools Platform for Eclipse"
arch=('any')
url="http://www.eclipse.org/datatools/"
license=('EPL')
depends=( 'eclipse' 'eclipse-emf' 'eclipse-gef' )
options=('!strip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/datatools/downloads/1.12/dtp_1.12.0.zip")
md5sums=('6f40875241e77b0a797fa80396bee8fe')

package() {
	cd $srcdir
	install -dm755 $pkgdir/usr/share/eclipse/dropins/dtp/
	find eclipse -type f -exec install -Dm644 {} \
		$pkgdir/usr/share/eclipse/dropins/dtp/{} \;
}
