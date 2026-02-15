# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.1.5
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
sha256sums=('d65619159d79d3a217ad15554f7136a00a4cda86f70e69fd0e2597d2cf280839')

package() {
    install -Dm755 "$srcdir/reels-linux-amd64" "$pkgdir/usr/bin/reels"
}
