# Contributor: Muhammad Mabrouk <MuhammadMabrouk@gmail.com>

pkgname=python-portio
pkgver=0.5
pkgrel=1
pkgdesc='PortIO, python low level port I/O for Linux x86'
url='https://pypi.org/project/portio/'
license=(GPL)
arch=('x86_64')
depends=(python)
source=(https://files.pythonhosted.org/packages/6f/2c/ecd9ed70555b8dc08a1b24a448b13cb77ff2c19e39df25fe9d22816d192d/portio-$pkgver.tar.gz)
sha256sums=('SKIP')

package() {
  cd portio-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}