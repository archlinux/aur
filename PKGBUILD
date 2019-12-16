# Maintainer: Jose Riha < jose 1711 gmail com >
# Contributor: twiggers

pkgname=python-pympress
pkgver=1.4.1
pkgrel=2
pkgdesc="Dual-screen PDF reader designed for presentations"
url="https://cimbali.github.io/pympress/"
license=('GPL-2')
arch=('any')
makedepends=('python-setuptools')
depends=('python-vlc' 'poppler' 'python-gobject' 'cairo' 'gtk3' 'perl-x11-protocol' 'perl-net-dbus' 'python-watchdog' 'poppler')
source=("https://github.com/Cimbali/pympress/archive/v${pkgver}.tar.gz")
md5sums=('8d58deca4d9dfe0111b1550d56daac2a')
 
build() {
	cd $srcdir/pympress-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/pympress-$pkgver
	python setup.py install --root="${pkgdir}" --optimize=1
}
