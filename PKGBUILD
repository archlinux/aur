# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Brian Weasner <weasnerb at gmail dot com>
_projectname='MaterialDesign-Webfont'
pkgname='ttf-material-design-icons-webfont'
pkgver='6.7.96'
pkgrel='1'
pkgdesc='Material Design webfont icons from materialdesignicons.com'
arch=('any')
url='https://materialdesignicons.com'
license=('Apache')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/Templarian/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('605143744bfce705896008ca1fac1add2eaeedd4456166aeaeaf3cb290da58fade416a8a43bf68731effa861b5e3331a804a2932aa175d4b2e3992a775ff7232')

package() {
	install -Dm644 "$srcdir/$_projectname-$pkgver/fonts/materialdesignicons-webfont.ttf" "$pkgdir/usr/share/fonts/TTF/materialdesignicons-webfont.ttf"
}
