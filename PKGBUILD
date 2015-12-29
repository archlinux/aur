# Maintainer: Jean Carlo Machado <contato@jeancarlomachado.com.br>
pkgname=fittstool
pkgver=master
pkgrel=1
depends=('libxcb'
'glib2')
pkgdesc="This utility allows you to do just that - bind commands to mouse button events on the screen corners, via a simple and concise configuration file."
arch=('x86_64')
url="https://github.com/jeanCarloMachado/fittstool"
license=('unknown')
source=("https://github.com/jeanCarloMachado/fittstool/archive/master.zip")
md5sums=(6146f8441722801b3f1f6b264d492c7f)
build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
