# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: Matt Bray <mattjbray@gmail.com>
pkgname=elm-format-bin
pkgver=0.8.5
pkgrel=1
epoch=
pkgdesc="Format Elm source code according to a standard set of rules based on the official Elm Style Guide."
arch=('i686' 'x86_64')
url="https://github.com/avh4/elm-format"
license=('BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(elm-format)
conflicts=(elm-format-0.16-bin elm-format-0.17-bin elm-format-0.18-bin elm-format-0.18-exp-bin elm-format-0.19-bin)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/avh4/elm-format/releases/download/${pkgver}/elm-format-${pkgver}-linux-x64.tgz"
        "https://github.com/avh4/elm-format/releases/download/${pkgver}/elm-format-${pkgver}-linux-x64.tgz.asc"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/avh4/elm-format/${pkgver}/LICENSE")
noextract=()
sha256sums=('147c479e375b9bae8dd633e526677fbd2a87e5445b3638ebee86c1319ffe8e23'
            'SKIP'
            '4c6b68b38e955813d0c7f2e57c9b07de19bde5fcfce930b2cfdb59d8469cfdfa')
validpgpkeys=('77C4B904349CF1E55BBD8FE479AC6B2F3F6CCA93')

package() {
  install -Dm755 "elm-format" "$pkgdir/usr/bin/elm-format"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/elm-format/LICENSE"
}
