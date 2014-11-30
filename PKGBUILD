# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=jtoolkit
pkgver=0.7.8
pkgrel=2
pkgdesc="Python web application framework built on modpython and Apache"
arch=('any')
url="http://jtoolkit.sourceforge.net/"
license=('GPL')
depends=('python2')
source=(http://jtoolkit.sourceforge.net/snapshots/jToolkit-$pkgver/jToolkit-$pkgver.tar.gz)
md5sums=('47d0c1fd2f7a4e3f990cdc4917e56138')

package() {
  cd "${srcdir}"/jToolkit-$pkgver

  python2 jToolkitSetup.py install --root="${pkgdir}"
}
