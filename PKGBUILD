# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-charm-1.14.4-bin
pkgver=1.3.4
pkgrel=1
epoch=
pkgdesc="A Vanilla+ Minecraft mod inspired by Quark."
arch=('any')
url="https://github.com/svenhjol/Charm"
license=('MIT')
depends=('forge-server')
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.jar::https://github.com/svenhjol/Charm/releases/download/1.14.4-$pkgver/Charm-1.14.4-$pkgver.jar" "LICENSE")
noextract=("$pkgname-$pkgver.jar")
sha256sums=('c5a9d9215291207996cea1b81fb28d1dcd14b4d28b67e801a6997e4fd6ad5c23'
            'a2735ddedb3d10060306a06e47937549cff323bb9991331ea2fbf2c7585f0509')

package() {
    cd $srcdir
    install -D -m644 -g forge -o forge "$pkgname-$pkgver.jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
