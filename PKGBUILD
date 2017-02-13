# Maintainer: Olga Smirnova <mistresssilvara@hotmail.com>
pkgname=locale-ie
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Interlingue locale data"
arch=('any')
url="http://"
license=('Apache')
groups=()
depends=('glibc')
install=$pkgname.install
changelog=
source=("$pkgname.tar.xz" "$pkgname.tar.xz.asc")
md5sums=("9c58bfa4342f977b6e4777f8aae67311"
	"SKIP")
validpgpkeys=("B8962B8D8C337D8E1F65CDD16CEA378170E3F079")

prepare() {
	sed -i {s/i18n:2000/i18n:2012/} "$srcdir/usr/share/i18n/locales/ie"
}

package() {
	cp -r usr "$pkgdir/"
}

