# Maintainer: rpizerow2-rgb <rpizerow2@gmail.com>
pkgname=pmgui
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight, zero-confirmation GUI for Arch Linux package management and AUR"
arch=("any")
url="https://github.com/rpizerow2-rgb/pmgui"
license=("MIT")
depends=("python" "python-pyqt6" "yay" "polkit")
makedepends=("python-setuptools")

# Puntiamo direttamente alla release ufficiale di GitHub che abbiamo appena taggato
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rpizerow2-rgb/pmgui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('778909b0e1fb5549314dc17d6e94d01a0fda8e3b33f8f2b2777e2fa0f1d2d35d')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
