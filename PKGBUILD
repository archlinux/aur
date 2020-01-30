# Maintainer: Jose Riha < jose 1711 gmail com >
# Contributor: twiggers

pkgname=python-pympress
pkgver=1.5.1
pkgrel=1
pkgdesc="Dual-screen PDF reader designed for presentations"
url="https://cimbali.github.io/pympress/"
license=('GPL-2')
arch=('any')
makedepends=('python-setuptools')
depends=('python-vlc' 'poppler' 'python-gobject' 'cairo' 'gtk3' 'perl-x11-protocol' 'perl-net-dbus' 'python-watchdog' 'poppler')
source=("https://github.com/Cimbali/pympress/archive/v${pkgver}.tar.gz")
md5sums=('2ad36282d3bd32eac71d64e98366d22b')
 
build() {
	cd $srcdir/pympress-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/pympress-$pkgver
	python setup.py install --root="${pkgdir}" --optimize=1
}
