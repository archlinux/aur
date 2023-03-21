# Maintainer: iFlygo <iflygo@outlook.com>

_pkgname=figma-linux
pkgname=$_pkgname-git
pkgver=0.10.0
pkgrel=1
pkgdesc="Figma-linux is an unofficial Electron-based Figma desktop app for Linux."
arch=('x86_64')
url="https://github.com/Figma-Linux/figma-linux"
license=('GPL')
conflicts=("$_pkgname")
depends=(

)
options=(

)
makedepends=(
  'rust'
  'npm'
)
source=("${_pkgname}"::'git+https://github.com/Figma-Linux/figma-linux.git')
sha256sums=("SKIP")

prepare() {
  cd "${_pkgname}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm i
  npm run build
}

package() {
  echo "test"

}
