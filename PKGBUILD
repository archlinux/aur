# Maintainer: lesebas <sebastiendotdelignyatgmail.com>

pkgname=python-hurry-filesize
pkgver=0.9
pkgrel=4
pkgdesc="A simple Python library for human readable file sizes (or anything sized in bytes)."
arch=('any')
url="http://pypi.python.org/pypi/hurry.filesize/"
license=('GPL')
depends=('python')
makedepends=('python-pip' 'python-wheel')
source=("https://files.pythonhosted.org/packages/ee/5e/16e17bedcf54d5b618dc0771690deda77178e5c310402881c3d2d6c5f27c/hurry.filesize-0.9.tar.gz")
md5sums=('8549ccd09bb31b5ff1e8e8c1eacc7794')

package() {
   python -m pip install ./hurry.filesize-0.9.tar.gz
}

