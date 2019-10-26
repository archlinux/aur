# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship-bin'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.25.2'
pkgrel='1'
arch=('x86_64')
url='https://starship.rs/'
license=('ISC')
depends=('openssl' 'zlib')
optdepends=('powerline-fonts: powerline symbols for terminals'
            'noto-fonts-emoji: emoji support for terminals')
makedepends=()
checkdepends=()
provides=('starship')
conflicts=('starship')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/starship/starship/releases/download/v${pkgver}/starship-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e06c61b0deb137fc41f22537c5ccbdff8fe9f499b6090c0921d74c566e9fccfc')
PKGEXT='.pkg.tar.gz'

package() {
    install -Dm755 "target/x86_64-unknown-linux-gnu/release/starship" "$pkgdir/usr/bin/starship"
#    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
