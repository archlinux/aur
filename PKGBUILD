# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller-git
__pkgname=Proton-Caller
pkgver=1.4.0
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
  'dxvk'
  'git'
)
conflicts=(proton-caller)

source=("git+https://github.com/caverym/$__pkgname.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$__pkgname"
  make
}

package() {
  make install-pkgbuild
}
