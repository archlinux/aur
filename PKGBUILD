
# Maintainer: rpizerow2-rgb <rpizerow2@gmail.com>
pkgname=pmgui
pkgver=1.1.0
pkgrel=1
pkgdesc="A lightweight, zero-confirmation GUI for Arch Linux package management and AUR"
arch=("any")
url="https://github.com/rpizerow2-rgb/pmgui"
license=("MIT")
depends=("python" "python-pyqt6" "yay" "polkit")
makedepends=("python-setuptools")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rpizerow2-rgb/pmgui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7f624c82dab4d837e8b8e23db1632f1b5473debb2e1c11b3db2640ab4045ad00')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
