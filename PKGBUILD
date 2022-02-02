# Maintainer: lesebas <sebastiendotdelignyatgmail.com>

pkgname=python-hurry-filesize
pkgver=0.9
pkgrel=6
pkgdesc="A simple Python library for human readable file sizes (or anything sized in bytes)."
arch=('any')
url="http://pypi.python.org/pypi/hurry.filesize/"
license=('GPL')
depends=('python')
makedepends=('python-pip' 'python-wheel')
source=()

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps hurry.filesize
}

