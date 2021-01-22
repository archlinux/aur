# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tela-icon-theme
_pkgver=2021-01-21
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://www.pling.com/p/1279924"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/vinceliuice/Tela-icon-theme/archive/$_pkgver.tar.gz")
sha256sums=('aca41d6e449d66240ad2c484edae96a26d32dd69995a9a8ce3edd4b0d5fb2b70')

package() {
	cd "Tela-icon-theme-$_pkgver"
	install -d "$pkgdir/usr/share/icons"
	./install.sh -a -d "$pkgdir/usr/share/icons"
}
