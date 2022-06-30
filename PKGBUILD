# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Brian Weasner <weasnerb at gmail dot com>
_projectname='MaterialDesign-Webfont'
pkgname='ttf-material-design-icons-webfont'
pkgver='6.9.96'
pkgrel='1'
pkgdesc='Material Design webfont icons from materialdesignicons.com'
arch=('any')
url='https://materialdesignicons.com'
license=('Apache')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/Templarian/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('be59d02cfbc64b6acafe3841cdc83fb9c19a9619b379d7caa1732f7d507bbeceee6b4fdc0a4d0fc22875f1d69f73cc99ff9056969194cdd45c6f5a3373eb9339')

package() {
	install -Dm644 "$srcdir/$_projectname-$pkgver/fonts/materialdesignicons-webfont.ttf" "$pkgdir/usr/share/fonts/TTF/materialdesignicons-webfont.ttf"
}
