# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship-bin'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.27.0'
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
sha256sums=('ad890fd3cbc3f950cea8798aecaee5c9f6230dbf71930077bc6da7962886d63b')

package() {
    install -Dm755 "starship" "$pkgdir/usr/bin/starship"
#    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
