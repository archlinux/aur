# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: Matt Bray <mattjbray@gmail.com>
pkgname=elm-format-bin
pkgver=0.8.1
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
md5sums=('366c584a6bb551fd8c5ecfd62109ea1e'
         'SKIP'
         '66f2ab57c97494e29cc93d062395eb5f')
validpgpkeys=('C3B74EE9EBC8412DFEE1FECE11357FB6FDD7BEC0')

package() {
  install -Dm755 "elm-format" "$pkgdir/usr/bin/elm-format"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/elm-format/LICENSE"
}
