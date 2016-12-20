# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=cty
pkgver=2614
pkgrel=1
pkgdesc="The package represents databases of entities (countries), prefixes and callsigns
	that are used by amateur radio logging software - CONTESTING VERSION."
arch=('any')
provides=('cty')
conflicts=('bigcty')
url="http://www.country-files.com/cty"
license=('GPL')
source=(${url}/download/$pkgver/${pkgname}-$pkgver.zip)

package() {
	mkdir -p  $pkgdir/usr/share/cty/old

	cd $srcdir

	cp -R *.{cty,dat} old $pkgdir/usr/share/cty
}

md5sums=('52ec1f5f02ea06f8f280c1f99ba66562')
sha256sums=('54167802b3dfa0c39c2a7bceeaab4206359efa282c798d19f85947eb6838ca96')
