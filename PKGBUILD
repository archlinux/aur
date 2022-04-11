# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=wofi-calc
pkgver=1.1
pkgrel=2
epoch=
pkgdesc="A simple calculator for wofi, inspired in rofi-calc."
arch=(any)
url="https://github.com/Zeioth/wofi-calc.git"
license=('MIT')
groups=()
depends=(wofi libqalculate)
makedepends=(wofi libqalculate)
checkdepends=()
optdepends=()
provides=(wofi-calc)
conflicts=(wofi-calc-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
  cp "${srcdir}"/wofi-calc/wofi-calc.sh ~/.local/bin/wofi-calc
  chmod u+x ~/.local/bin/wofi-calc
}
