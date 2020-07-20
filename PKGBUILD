# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('autotiling')
pkgver=1.1
pkgrel=1
pkgdesc="Script for sway and i3 to automatically switch the horizontal / vertical window split orientation"
arch=('x86_64')
url="https://github.com/nwg-piotr/autotiling"
license=('GPL3')
depends=('python-i3ipc')
makedepends=('python-setuptools')
source=("https://github.com/nwg-piotr/autotiling/archive/v"$pkgver".tar.gz")

md5sums=('a42f55005bfcf631d6429fbdfc9d5b2b')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

