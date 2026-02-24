# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.1.7
pkgrel=1
pkgdesc="Instagram reels in the terminal"
arch=('x86_64')
url="https://github.com/njyeung/reels"
license=('MIT')
depends=('ffmpeg' 'alsa-lib')
optdepends=('chromium: browser backend' 'google-chrome: browser backend' 'brave-bin: browser backend')
provides=('reels')
conflicts=('reels')
source=("https://github.com/njyeung/reels/releases/download/v${pkgver}/reels-linux-amd64")
sha256sums=('52eb8072e94791982e7b8b3327bb877ab88cca6cd18e2882d031d4fca279ea2d')

package() {
    install -Dm755 "$srcdir/reels-linux-amd64" "$pkgdir/usr/bin/reels"
}
