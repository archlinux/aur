# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: Matt Bray <mattjbray@gmail.com>
pkgname=elm-format-bin
pkgver=0.8.3
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
md5sums=('f13c16570b240694e27e00ca234bd5e1'
         'SKIP'
         '547aa901ebac3bd013c6579006dca1eb')
validpgpkeys=('C3B74EE9EBC8412DFEE1FECE11357FB6FDD7BEC0')

package() {
  install -Dm755 "elm-format" "$pkgdir/usr/bin/elm-format"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/elm-format/LICENSE"
}
