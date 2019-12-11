# Maintainer: Holger Brandl https://github.com/holgerbrandl/kscript/

pkgname=kscript
pkgver=2.9.0
pkgrel=1
pkgdesc='Enhanced scripting support for Kotlin on *nix-based systems'
arch=('any')
url='https://github.com/holgerbrandl/kscript'
license=('MIT')
depends=('kotlin')
source=("-.bin.zip::https://github.com/holgerbrandl//releases/download/v/--bin.zip")
sha256sums=('3d62b0db226566506a2531d765547595867230cd5d44dbedc65301cadfecdaaf')

package() {
    cd "/-/bin"

    install -Dm 755 kscript "/usr/bin/kscript"
    install -Dm 644 kscript.jar "/usr/bin/kscript.jar"
}

