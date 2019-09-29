# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship-bin'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.19.0'
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
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('bf11ac014f42e94225d2a8f128315d7218c5e2d9ca9970f265617468edaf6bca')
PKGEXT='.pkg.tar.gz'

package() {
    cd "x86_64-unknown-linux-gnu"
    install -Dm755 "starship" "$pkgdir/usr/bin/starship"
#    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
