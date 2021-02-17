# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_de_skr03
_name=trytond_account_de_skr03
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with German chart of accounts SKR03"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('63c4de6bbe258093dda1edf2aa9b4cf15a8b898e9de638a082f78d2d8610fd25')
sha512sums=('c172b3d6733d996d95fb5dc17a58c2096679260f467aeb4939fe5d71a6f7d547715efa533702e078d9ccf36561faad59d3bd744ff070283bceb9efdf83b4af72')
b2sums=('5b66ec7194c1a1702cad7ac42dcd269390d5296107f3fbe54af12237a3d6dd8b740abb35165be62a8b2b06e545a090fe4d7502f1710102b1f152452a00d9b0b9')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
