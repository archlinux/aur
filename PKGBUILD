# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-py7zr
pkgver=0.11.0
pkgrel=1
pkgdesc="7zip implementation in pure python3 with various compression methods"
provides=('python-py7zr')
conflicts=('python-py7zr')
arch=(any)
url="https://github.com/miurahr/py7zr"
license=(LGPL2.1)
depends=("python" "python-texttable" "python-pycryptodome")
makedepends=("python" "python-setuptools-scm" "python-setuptools" "python-wheel" "python-pep517")
source=("https://github.com/miurahr/py7zr/archive/v$pkgver.tar.gz")
sha512sums=('011a98f666e3d6d5fefa10a11e09a146ec513367be84d96a6a5b9253742bb5d28f7e8f285206bb627042b42d44eeeb47a430aa69c098f30533028087845f0e47')

package() {
  cd $srcdir/py7zr-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
