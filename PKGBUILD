# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-mantle-1.14.4-bin
pkgver=1.4.32
pkgrel=1
epoch=
pkgdesc="Public shared library for Forge mods"
arch=('any')
url="https://github.com/SlimeKnights/Mantle"
license=('MIT')
depends=('forge-server')
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.jar::https://media.forgecdn.net/files/2804/948/Mantle-1.14.4-$pkgver.jar" "LICENSE")
noextract=("$pkgname-$pkgver.jar")
sha256sums=('39cf1d3975ffdd9f6b05e189fc61e3aa5d9165ddf8068cacea02a556975f060b'
            '90d0b0e134c1ab8c69341ff7ab37c3a7a0f0bf6735736611298a0b76830c71cd')


package() {
    cd $srcdir
    install -D -m644 -g forge -o forge "$pkgname-$pkgver.jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
