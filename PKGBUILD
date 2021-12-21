# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-file-tree
_name=file-tree
pkgver=0.4.1
pkgrel=1
pkgdesc="Framework to represent structured directories in python as FileTree objects. It can also be used to visualise the data in structured directories using fsleyes."
arch=('any')
url="https://pypi.org/project/file-tree/"
license=('MIT')
depends=('python')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('1a9e5849923c5ca545305a82bf65bc542eb0a6be00a61e3f570a1a566522fffc')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
