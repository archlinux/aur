# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=fackup
pkgver=0.1.4
pkgrel=1
pkgdesc="File backup tool using rsync and dar."
arch=('i686' 'x86_64')
url="https://github.com/b3niup/fackup"
license=('MIT')
depends=('dar' 'rsync' 'python-yaml')
makedepends=('python')
install="${pkgname}.install"
source=(https://files.pythonhosted.org/packages/9c/f5/2a307d4edec9debd5af3c56e25170b1222c8672d5d24cc44287d9221421f/${pkgname}-${pkgver}.tar.gz)
md5sums=('ad76fe70631db0d9fb38c53314904186')

build() {
  true
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=$pkgdir
}
