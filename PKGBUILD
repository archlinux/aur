# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=python2-robofab
_pkgname=robofab
pkgver=1.2.1
pkgrel=1
pkgdesc='Tools to manipulate font sources.'
arch=('any')
url='http://robofab.com/'
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-fonttools')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ab4e4d734eba0cfa758011a5d9b050db56898fc16804d99bf5c3e487c4a36e09')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # build and install the package
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
