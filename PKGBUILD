# Maintainer: Jose Riha < jose 1711 gmail com >
# Contributor: twiggers

pkgname=python-pympress
pkgver=1.2.0
pkgrel=2
pkgdesc="Dual-screen PDF reader designed for presentations"
url="http://pympress.xyz/"
license=('GPL-2')
arch=('any')
depends=('python-vlc-git' 'poppler' 'python-gobject' 'cairo' 'gtk3' 'perl-x11-protocol' 'perl-net-dbus')
source=("https://github.com/Cimbali/pympress/archive/v${pkgver}.tar.gz")
md5sums=('b1bd6464e851903b65bf0297b4071f6d')
 
build() {
	cd $srcdir/pympress-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/pympress-$pkgver
	python setup.py install --root="${pkgdir}" --optimize=1
}
