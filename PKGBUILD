# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: Matt Bray <mattjbray@gmail.com>
_elm_version=0.19
pkgname=elm-format-bin
pkgver=0.8.0
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
conflicts=(elm-format-0.16-bin elm-format-0.17-bin elm-format-0.18-bin elm-format-0.18-exp-bin)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/avh4/elm-format/releases/download/${pkgver}/elm-format-${_elm_version}-${pkgver}-linux-x64.tgz"
        "https://github.com/avh4/elm-format/releases/download/${pkgver}/elm-format-${_elm_version}-${pkgver}-linux-x64.tgz.asc"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/avh4/elm-format/${pkgver}/LICENSE")
noextract=()
md5sums=('ecef0d7d0d66c7b35f9dd1c1ef5f9a52'
         'SKIP'
         'e3bb965f28c7631a1bac6d8611a1db7d')
validpgpkeys=('C3B74EE9EBC8412DFEE1FECE11357FB6FDD7BEC0')

package() {
  install -Dm755 "elm-format" "$pkgdir/usr/bin/elm-format"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/elm-format/LICENSE"
}
