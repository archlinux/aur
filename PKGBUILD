# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Brian Weasner <weasnerb at gmail dot com>
_projectname='MaterialDesign-Webfont'
pkgname='ttf-material-design-icons-webfont'
pkgver='7.0.96'
pkgrel='1'
pkgdesc='Material Design webfont icons from materialdesignicons.com'
arch=('any')
url='https://materialdesignicons.com'
license=('Apache')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/Templarian/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('d79e4ac57b3646b23e2fc340668d76e6c56521f874bb93e47144fdaf24b7a269e78d76ecb22c8d3b9076753fe7ac5a53f1a505e8cb6740fbbcdceb0f0ee9dd81')

package() {
	install -Dm644 "$srcdir/$_projectname-$pkgver/fonts/materialdesignicons-webfont.ttf" "$pkgdir/usr/share/fonts/TTF/materialdesignicons-webfont.ttf"
}
