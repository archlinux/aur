# Maintainer: Jose Riha < jose 1711 gmail com >
# Contributor: twiggers

pkgname=python-pympress
pkgver=1.3.1
pkgrel=3
pkgdesc="Dual-screen PDF reader designed for presentations"
url="http://pympress.xyz/"
license=('GPL-2')
arch=('any')
depends=('python-vlc' 'poppler' 'python-gobject' 'cairo' 'gtk3' 'perl-x11-protocol' 'perl-net-dbus')
source=("https://github.com/Cimbali/pympress/archive/v${pkgver}.tar.gz")
md5sums=('bef4d8fec4f8244d08b885feb85aa43f')
 
build() {
	cd $srcdir/pympress-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/pympress-$pkgver
	python setup.py install --root="${pkgdir}" --optimize=1
}
