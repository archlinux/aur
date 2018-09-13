# Maintainer: Alex Kubica <alexkubicail@gmail.com>
_name=decorating
pkgname=python-decorating
pkgver=0.6.1
pkgrel=1
pkgdesc="A Meta Repo To Decorators"
arch=(any)
url="https://pypi.python.org/pypi/decorating"
license=('MIT')
depends=('python')
source=('https://files.pythonhosted.org/packages/54/3a/3cb70592ff7208f38af494479f3ab19c124ad028c550f36ebee0ab4443a4/decorating-0.6.1.tar.gz')
md5sums=('9434f04a77ed2b7afae4f3f53f8f1ed0')

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
