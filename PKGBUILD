# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=cty
pkgver=2415
pkgrel=1
pkgdesc="The package represents databases of entities (countries), prefixes and callsigns
	that are used by amateur radio logging software - CONTESTING VERSION."
arch=('any')
provides=('cty')
conflicts=('bigcty')
url="http://www.country-files.com/cty"
license=('GPL')
source=(${url}/download/${pkgname}-$pkgver.zip)

package() {
	mkdir -p  $pkgdir/usr/share/cty/old

	cd $srcdir

	cp -R *.{cty,dat} old $pkgdir/usr/share/cty
}

md5sums=('77becc0f912763384d35af9786bf184f')
sha256sums=('1944268993ccdc143482f01987b3b1790749ccbdaa2c807961528ecbf9be4bb6')
