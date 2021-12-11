# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-file-tree
_name=file-tree
pkgver=0.4.0
pkgrel=1
pkgdesc="Framework to represent structured directories in python as FileTree objects. It can also be used to visualise the data in structured directories using fsleyes."
arch=('any')
url="https://pypi.org/project/file-tree/"
license=('MIT')
depends=('python')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('3d9093dbd376dab8b12240b0de448b095778321bc0ce9d393c2ebd15ff1e3c8c')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
