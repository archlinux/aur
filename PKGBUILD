pkgname=dim-caelestia-shell-git
_pkgname=caelestia-shell
pkgver=r623.20351c6
pkgrel=1
pkgdesc="shell"
arch=('any')
url="https://github.com/dim-ghub/caelestia-shell"
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
  
}

package() {
  cd "${_pkgname}"
  
}
