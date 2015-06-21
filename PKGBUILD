# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=pdoc
_pypiname=pdoc
pkgver=0.2.4
pkgrel=1
pkgdesc="A simple program and library to auto generate API documentation for Python modules."
arch=('any')
url="https://github.com/BurntSushi/pdoc"
license=('UNLICENSE')
depends=('python'
         'python-mako'
         'python-markdown'
         'python-argparse')
conflics=('pdoc-git')
makedepends=('python-setuptools')
provides=('pdoc' 'python-pdoc')
source=("https://pypi.python.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('13392ddab6f7411fe54c1ff993d1623b')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
