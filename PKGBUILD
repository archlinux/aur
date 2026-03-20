# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.2.3
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
sha256sums=('3adfa1ee0d88332e0d817ee4ae31da5034db80c49f4828f90dae14994c6734a8')

package() {
    install -Dm755 "$srcdir/reels-linux-amd64" "$pkgdir/usr/bin/reels"
}
