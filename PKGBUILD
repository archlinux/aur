# Maintainer: Matt Bray <mattjbray@gmail.com>
pkgname=elm-format-0.18-bin
_source_pkgname=elm-format-0.18
pkgver=0.8.0
pkgrel=1
epoch=
pkgdesc="Format Elm source code according to a standard set of rules based on the official Elm Style Guide."
arch=('i686' 'x86_64')
url="https://github.com/avh4/elm-format"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(elm-format)
conflicts=(elm-format-0.16-bin elm-format-0.17-bin elm-format-0.19-bin)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "https://github.com/avh4/elm-format/releases/download/${pkgver//_/-}/$_source_pkgname-${pkgver//_/-}-linux-x64.tgz"
  "https://github.com/avh4/elm-format/releases/download/${pkgver//_/-}/$_source_pkgname-${pkgver//_/-}-linux-x64.tgz.asc"
  )
noextract=()
md5sums=(
  '63a58630d656a7e20023b88028e51412'
  'SKIP'
)
validpgpkeys=(
  'C3B74EE9EBC8412DFEE1FECE11357FB6FDD7BEC0'
)

# prepare() {
# }
# 
# build() {
# }
# 
# check() {
# }

package() {
  install -Dm755 "elm-format" "$pkgdir/usr/bin/elm-format"
}
