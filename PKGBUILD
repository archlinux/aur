# Maintainer: Aitor Alonso <contact: https://aalonso.eu>

pkgname=qogir-icon-theme-git
pkgver=1.0
pkgrel=1
pkgdesc='A colorful design icon theme for linux desktops'
arch=('any')
url='https://github.com/vinceliuice/Qogir-icon-theme'
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
provides=('qogir-icon-theme')
conflicts=('qogir-icon-theme')
source=('git+https://github.com/vinceliuice/Qogir-icon-theme')
sha256sums=('SKIP')

pkgver() {
  cd Qogir-icon-theme
  git describe --tags | sed 's/-/./g'
}

package() {
  cd Qogir-icon-theme
  ./install.sh
}
