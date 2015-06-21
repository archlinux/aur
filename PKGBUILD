# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python-cmuclmtk
_pypiname=cmuclmtk
pkgver=0.1.5
pkgrel=1
pkgdesc="Wrapper library for accessing the language model tools for CMU Sphinx (CMUCLMTK)."
arch=('any')
url="https://github.com/Holzhaus/python-cmuclmtk"
license=('MIT')
depends=('python' 'cmuclmtk')
conflics=('python-cmuclmtk-git')
makedepends=('python-setuptools')
provides=('python-cmuclmtk')
source=("https://pypi.python.org/packages/source/c/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('87a2e2bf1f08a51509df558d7ad72def')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
