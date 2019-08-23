# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship-bin'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.12.2'
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
sha256sums=('a491a28eb6d8baf70fe7576c60ac7eb2d243ad7e94575f95bba0aeb7c9e0f4ca')
PKGEXT='.pkg.tar.gz'

package() {
    cd "x86_64-unknown-linux-gnu"
    install -Dm755 "starship" "$pkgdir/usr/bin/starship"
#    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
