# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-py7zr
pkgver=0.8.0
pkgrel=1
pkgdesc="7zip implementation in pure python3 with various compression methods"
provides=('python-py7zr')
conflicts=('python-py7zr')
arch=(any)
url="https://github.com/miurahr/py7zr"
license=(LGPL2.1)
depends=("python" "python-texttable" "python-pycryptodome" "python-contextlib2" "python-pathlib2")
makedepends=("python" "python-setuptools-scm" "python-setuptools" "python-wheel" "python-pep517")
source=("https://github.com/miurahr/py7zr/archive/v$pkgver.tar.gz")
sha512sums=('7c25e5f8efee4c07c4b4ceda253c1b62db25cd9351f8674e2fd2c162a2317acf8debdbfe353dc0b258388f56900b0d364481a58e805f801d4fd3d600780d0f6d')

package() {
  cd $srcdir/py7zr-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
