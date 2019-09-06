# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship-bin'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.15.0'
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
sha256sums=('f41b2b774b5ee71588ff181ee34a24a50bac5f4d164643be2405ebc45d42b7af')
PKGEXT='.pkg.tar.gz'

package() {
    cd "x86_64-unknown-linux-gnu"
    install -Dm755 "starship" "$pkgdir/usr/bin/starship"
#    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
