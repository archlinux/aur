# Maintainer: Lars Tennstedt
# Maintainer: Jan Kelemen <jan@jankelemen.com>
pkgname=elm-bin
pkgver=0.19.3
pkgrel=1
pkgdesc="Elm compiler (official binary)"
arch=('x86_64')
url="https://elm-lang.org"
license=('BSD')
source=("https://github.com/elm/compiler/releases/download/${pkgver}/elm-${pkgver}-linux-x64.gz"
        "https://raw.githubusercontent.com/elm/compiler/master/LICENSE")
noextract=('LICENSE')
sha256sums=('d11702b31577ed8b720b9d81c52c8a19a52b72b1fcfadef0fcad92f21798c58a'
            '22bd883c0b78625bb39a21b96d38ddcb8469863b51718b8bda1ce46441f5bfce')

package() {
    install -Dm755 "elm-${pkgver}-linux-x64" "${pkgdir}/usr/bin/elm"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
