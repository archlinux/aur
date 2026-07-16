pkgname=dim-caelestia-cli-git
_pkgname=caelestia-cli
pkgver=r623.20351c6
pkgrel=1
pkgdesc="The CLI tool for the Caelestia project (Git development version)"
arch=('any')
url="https://github.com/dim-ghub/caelestia-cli"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  # build
}

package() {
  cd "${_pkgname}"
  # install cmd
}
