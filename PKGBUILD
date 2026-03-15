# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.2.1
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
sha256sums=('7707f784920947b5be5ec11aa640265f4cd048b0b63673e36b7a18e5c4e718f5')

package() {
    install -Dm755 "$srcdir/reels-linux-amd64" "$pkgdir/usr/bin/reels"
}
