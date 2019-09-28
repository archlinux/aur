# Maintainer: SanskritFritz (gmail)

pkgname=quasselsearch-git
_gitname=quasselsearch
pkgver=r9.e853905
pkgrel=1
pkgdesc="Search your sqlite based quassel core from the command line."
arch=('any')
url="https://github.com/karan42/quasselsearch"
license=('GPL2')

source=("git+https://github.com/karan42/quasselsearch.git")

md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -m755 "$_gitname/quasselsearch.sh" "${pkgdir}/usr/bin/quasselsearch.sh"

}

# vim:set ts=2 sw=2 et:
