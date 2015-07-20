# Maintainer: Samuel Vincent Creshal <samuel@creshal.de>

pkgname=ysnotifier
pkgver=0.5.1
pkgrel=1
pkgdesc="A minimal notification daemon for Gtk2."
arch=('any')
url="http://dev.yaki-syndicate.de/"
license=('GPL')
depends=('dbus-python' 'pygtk' 'python2>=2.7')
makedepends=()
provides=("notification-daemon")
conflicts=("notification-daemon")
source=("$pkgname-$pkgver.tar.gz::https://github.com/creshal/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("5bf467699014b7901040f105c2253439bc795ec9a2e0ae523ae59b7bf0a13f10")

package () {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}

