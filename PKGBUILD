# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship-bin'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.20.2'
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
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d9d1dcc4200fbd7fed7abd552c207000d9592b4e25f7348180921a49d97d61be')
PKGEXT='.pkg.tar.gz'

package() {
    install -Dm755 "starship" "$pkgdir/usr/bin/starship"
#    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
