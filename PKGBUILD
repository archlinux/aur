# Maintainer: Andreas Bakseter <andreas_tkd@hotmail.com>

pkgname=gren-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Compiler for the Gren programming language."
arch=('x86_64')
url="https://github.com/gren-lang/compiler"
license=('custom')
source=("$url/releases/download/v$pkgver/gren_linux"
        "https://raw.githubusercontent.com/gren-lang/compiler/main/LICENSE")
md5sums=('488d3c456fb8110ca126e049d4852090'
         '9a4c31c12d4929e1a5b5fee6c2927b6c')

package() {
    mv gren_linux gren
    install -Dm755 -t "${pkgdir}/usr/bin" gren
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
