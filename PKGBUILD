# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tela-icon-theme
_pkgname=Tela-icon-theme
pkgver=2020.05.06
_pkgver=2020-05-06
pkgrel=1
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://www.pling.com/p/1279924"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz")
sha256sums=('3b0db8ae3bb9288351b763510cfdaa30aa906f70ba347a5e307cab7024872fe2')

package() {
	cd "$_pkgname-$_pkgver"
	install -dm755 "$pkgdir/usr/share/icons"
	./install.sh -a -d "$pkgdir/usr/share/icons"
}
