# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Brian Weasner <weasnerb at gmail dot com>
_projectname='MaterialDesign-Webfont'
pkgname='ttf-material-design-icons-webfont'
pkgver='5.8.55'
pkgrel='1'
pkgdesc='Material Design webfont icons from materialdesignicons.com'
arch=('any')
url='https://materialdesignicons.com/'
license=('Apache')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/Templarian/$_projectname/archive/v$pkgver.tar.gz")
sha256sums=('a4a099410c039aa7e4b8bfa62470ea8746b31d4244e4abd49398b323c909279d')

package() {
	install -Dm644 "$srcdir/$_projectname-$pkgver/fonts/materialdesignicons-webfont.ttf" "$pkgdir/usr/share/fonts/TTF/materialdesignicons-webfont.ttf"
}
