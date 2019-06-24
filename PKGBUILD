# Maintainer: n3e <n3e at thathat dot net>

pkgname=texlive-tlpdb
pkgver=2019
pkgrel=2
pkgdesc='The texlive package database (texlive.tlpdb)'
arch=('any')

url="https://www.tug.org/texlive/"
license=('GPL')

depends=('texlive-core')

source=(
  http://tug.ctan.org/systems/texlive/tlnet/tlpkg/texlive.tlpdb
)
sha512sums=(
  'SKIP'
)
noextract=(
  texlive.tlpdb
)

prepare() {
  /usr/bin/true
}

build() {
  /usr/bin/true
}

package() {
  install -d -m755 "$pkgdir"/usr/share/tlpkg/
  install    -m644 "$srcdir"/texlive.tlpdb "$pkgdir"/usr/share/tlpkg/
}

