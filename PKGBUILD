# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=git-prebase-git
pkgver=r22.f2eb7fa
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/koreno/prebase"
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/prebase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "prebase/git-prebase" "${pkgdir}/usr/bin/git-prebase"
}
