# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
pkgname=binnavi-git
pkgver=0.0.590.8512d7c
pkgrel=1
pkgdesc="BinNavi is a binary analysis IDE that allows to inspect, navigate, edit and annotate control flow graphs and call graphs of disassembled code"
url="https://github.com/google/binnavi"
arch=('any')
license=('Apache')
depends=()
makedepends=('git')
provides=('binnavi')
conflicts=('binnavi')
source=(${pkgname}::https://github.com/google/binnavi.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "0.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  echo "in work"
}

# vim:set et sw=2 ts=2 tw=80:
