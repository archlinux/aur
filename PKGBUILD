# Maintainer: Nick Yeung <nickjyeung@gmail.com>
pkgname=reels-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="TUI Instagram Reels viewer"
arch=('x86_64')
url="https://github.com/njyeung/reels"
license=('MIT')
depends=('ffmpeg' 'alsa-lib')
optdepends=('chromium: browser backend' 'google-chrome: browser backend' 'brave-bin: browser backend')
provides=('reels')
conflicts=('reels')
source=("https://github.com/njyeung/reels/releases/download/v${pkgver}/reels-linux-amd64")
sha256sums=('4c9d49b2ebeb14a733cf6f7747797c3693bdcbf9431c28440d1330d89739ca39')

package() {
    install -Dm755 "$srcdir/reels-linux-amd64" "$pkgdir/usr/bin/reels"
}
