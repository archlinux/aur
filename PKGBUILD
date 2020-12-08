# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-py7zr
pkgver=0.11.1
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
sha512sums=('82a4f5dd3cd5ed5346bdc436afa32fb637aa9c3304e277412c92d71e7f54a02003b3cc817acb67f4214419f68ed2fb6dce7145399aa7141233f30973e24e2b9d')

package() {
  cd $srcdir/py7zr-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
