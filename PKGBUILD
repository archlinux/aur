# Maintainer: n3e <n3e at thathat dot net>

pkgname=texlive-tlpdb
pkgver=2019
pkgrel=1
pkgdesc='The texlive package database (texlive.tlpdb)'
arch=('any')

url="https://www.tug.org/texlive/"
license=('GPL')

depends=('texlive-core')

source=(
  http://tug.ctan.org/systems/texlive/tlnet/tlpkg/texlive.tlpdb
)
sha512sums=(
  '0e9fdef51236fe527b8f23ff973117289e1ef5bbf3e67e4e1e398bc0029d14ee6f9dd26a01c555021a75da4e926edfe9836008df1d73151c75d55cabc997f11a'
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

