# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=yatoc2cue
pkgver=0.7
_pkgver=07
pkgrel=1
pkgdesc="converts a cdrdao .toc file to a .cue as known from tools like EAC"
arch=('any')
url="http://yatoctocue.sourceforge.net"
license=('GPL')
depends=('perl' 'perl-switch')
source=("http://iweb.dl.sourceforge.net/project/yatoctocue/v$pkgver/$pkgname$_pkgver.tar.bz2")
sha256sums=('bb940e153d43c50cafe235e207a92d32a902e8e61d5ea1e27efaf01f932843d6')

package() {
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
