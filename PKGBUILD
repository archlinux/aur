# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Chris Lane <aur at chrislane dot com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
# Contributor: Federico Damián <federicodamians@gmail.com>
pkgname=vimix-icon-theme
pkgver=2020.02.24
_pkgver=2020-02-24
pkgrel=1
pkgdesc="A Material Design icon theme based on Paper Icon Theme"
arch=('any')
url="https://github.com/vinceliuice/vimix-icon-theme"
license=('CC BY-SA 4.0')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('9f45abc7f1fa5212ed0453a9de54a8996786e38636e2cf07f8193667cef86358')

package() {
	cd "$pkgname-$_pkgver"
	install -dm755 "$pkgdir/usr/share/icons"
	./install.sh -a -d "$pkgdir/usr/share/icons"

	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
