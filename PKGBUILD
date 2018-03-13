# Maintainer: Andrei Pavel <andrei.pavel@cti.pub.ro>
pkgname='curate-pkg-git'
pkgver='r36.92c9d88'
pkgrel=1
epoch=
pkgdesc='curate-pkg: that script you craved for to keep a consistent image of installed packages across **ALL** package managers'
arch=('i686' 'x86_64')
url='https://github.com/andrei-pavel/curate-pkg'
license=('MIT')
depends=('bash-spinner' 'unp' 'yq')
makedepends=('git')
provides=('curate-pkg')
conflicts=()
source=('git+https://github.com/andrei-pavel/curate-pkg.git')
md5sums=('SKIP')

pkgver() {
  cd 'curate-pkg-git'
  printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd 'curate-pkg-git'
  ./install
}

