# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Brian Weasner <weasnerb at gmail dot com>
_projectname='MaterialDesign-Webfont'
pkgname='ttf-material-design-icons-webfont'
pkgver='7.4.47'
pkgrel='1'
pkgdesc='Material Design webfont icons from materialdesignicons.com'
arch=('any')
url='https://materialdesignicons.com'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Templarian/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('31f3494be5fcde45a3a0138948b1ec0a73b56f8a999449cfd96c7eacd8d1dbae0fdc7e76f7da4b61b1e53e3b28fd21a9369ab190317067f62c1e643b908eec61')

package() {
	install -Dm644 "$srcdir/$_projectname-$pkgver/fonts/materialdesignicons-webfont.ttf" "$pkgdir/usr/share/fonts/TTF/materialdesignicons-webfont.ttf"
}
