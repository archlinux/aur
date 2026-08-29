# Maintainer: Lars Tennstedt
pkgname=elm-bin
pkgver=0.19.2
pkgrel=1
pkgdesc="Elm compiler (official binary)"
arch=('x86_64')
url="https://elm-lang.org"
license=('BSD')
source=("https://github.com/elm/compiler/releases/download/${pkgver}/elm-${pkgver}-linux-x64.gz"
        "https://raw.githubusercontent.com/elm/compiler/master/LICENSE")
noextract=('LICENSE')
sha256sums=('66320d27701654fa11bd0e8d84bdf9829694d5770c8dcee2dede6160fad58737'
            '22bd883c0b78625bb39a21b96d38ddcb8469863b51718b8bda1ce46441f5bfce')

package() {
        mv elm-0.19.2-linux-x64 elm 
	install -Dm755 -t "${pkgdir}/usr/bin" elm
        install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
