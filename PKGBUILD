# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship-bin'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.14.1'
pkgrel='1'
arch=('x86_64')
url='https://starship.rs/'
license=('ISC')
depends=('openssl' 'zlib')
makedepends=()
checkdepends=()
provides=('starship')
conflicts=('starship')
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8b722e062ecc87b12dfaa8d9a81e180072101d9036574a2a165d9da4e47d5362')
PKGEXT='.pkg.tar.gz'

package() {
    cd "x86_64-unknown-linux-gnu"
    install -Dm755 "starship" "$pkgdir/usr/bin/starship"
#    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
