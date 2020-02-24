# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tela-icon-theme
_pkgname=Tela-icon-theme
pkgver=2020.02.21
_pkgver=2020-02-21
pkgrel=1
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://github.com/vinceliuice/Tela-icon-theme"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('fc91d4fc8723758744c5fd8088393ae3faa212060b8289ecbea1adcecf4c7f25')

package() {
	cd "$_pkgname-$_pkgver"
	install -dm755 "$pkgdir/usr/share/icons"
	./install.sh -a -d "$pkgdir/usr/share/icons"
}
