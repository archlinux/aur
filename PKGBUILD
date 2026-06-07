
# Maintainer: rpizerow2-rgb <rpizerow2@gmail.com>
pkgname=pmgui
pkgver=1.1.1
pkgrel=1
pkgdesc="A lightweight, zero-confirmation GUI for Arch Linux package management and AUR"
arch=("any")
url="https://github.com/rpizerow2-rgb/pmgui"
license=("MIT")
depends=("python" "python-pyqt6" "yay" "polkit")
makedepends=("python-setuptools")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rpizerow2-rgb/pmgui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("SKIP")

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
