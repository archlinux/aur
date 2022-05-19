# Maintainer: Jonas Gunz <arch at jonasgunz dot de>
pkgbase=comic-shanns
pkgname=("otf-comic-shanns-v1" "otf-comic-shanns-v2" "ttf-comic-shanns-v2")
_pkgname=comic-shanns
pkgver=r16.b98eee0
pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="version 2 of a classy font"
makedepends=(git)
arch=('any')
url="https://github.com/shannpersand/comic-shanns"
license=('MIT')
source=("git+https://github.com/shannpersand/$_pkgname")
sha256sums=('SKIP')

package_otf-comic-shanns-v1() {
  cd "$srcdir/$_pkgname"

  install -Dt "$pkgdir/usr/share/fonts/OTF" "v1/comic-shanns.otf"
  install -Dt "$pkgdir"/usr/share/doc/otf-comic-shanns README.md
  install -Dt "$pkgdir"/usr/share/licenses/otf-comic-shanns LICENSE
}

package_otf-comic-shanns-v2() {
  cd "$srcdir/$_pkgname"

  install -Dt "$pkgdir/usr/share/fonts/OTF" "v2/comic shanns.otf"
  install -Dt "$pkgdir"/usr/share/doc/otf-comic-shanns-v2 README.md
  install -Dt "$pkgdir"/usr/share/licenses/otf-comic-shanns-v2 LICENSE
}

package_ttf-comic-shanns-v2() {
  cd "$srcdir/$_pkgname"

  install -Dt "$pkgdir/usr/share/fonts/TTF" "v2/comic shanns 2.ttf"
  install -Dt "$pkgdir"/usr/share/doc/ttf-comic-shanns-v2 README.md
  install -Dt "$pkgdir"/usr/share/licenses/ttf-comic-shanns-v2 LICENSE
}

# vim:set ts=2 sw=2 et:
