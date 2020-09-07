# Maintainer: zhullyb <zhullyb@outlook.com>
# Author: presburger <mayushengmusic@gmail.com>

pkgname=qmc-decoder-bin
pkgver=2.5
pkgrel=1
pkgdesc="Fastest & best convert qmc 2 mp3 | flac tools"
arch=('x86_64')
url="https://github.com/Presburger/qmc-decoder"
license=('MIT')
depends=()
provides=('qmc-decoder')
conflicts=()

source=(
    "${url}/releases/download/2.5/decoder-linux"
    "LICENSE"
)

md5sums=(
    'cce6bb6250763450397608e6875d004b'
    '60b38304a9a9aa2422b233fc02dedc56'
)

package() {
    cd "$srcdir"
    
    install -Dm755 "decoder-linux" "$pkgdir/usr/bin/qmc-decoder"
    install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
} 
