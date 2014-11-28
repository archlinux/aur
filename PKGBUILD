# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=jtoolkit
pkgver=0.7.8
pkgrel=1
pkgdesc="Python web application framework built on modpython and Apache."
arch=('i686' 'x86_64')
url="http://jtoolkit.sourceforge.net/"
license=('GPL')
depends=('python')
source=(http://jtoolkit.sourceforge.net/snapshots/jToolkit-$pkgver/jToolkit-$pkgver.tar.gz)

md5sums=('47d0c1fd2f7a4e3f990cdc4917e56138')

build() {
  cd "${srcdir}/jToolkit-$pkgver"
  python jToolkitSetup.py install --root=${pkgdir} || return 1
}
