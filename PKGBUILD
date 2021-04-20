# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-file-tree
_name=file-tree
pkgver=0.3.5
pkgrel=1
pkgdesc="Framework to represent structured directories in python as FileTree objects. It can also be used to visualise the data in structured directories using fsleyes."
arch=('any')
url="https://pypi.org/project/file-tree/"
license=('MIT')
depends=('python')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('2d51b2933b4ce5d27f686d4d661ea290f4f8032c5abc6c18fd4df3669ed21969')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
