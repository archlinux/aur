
# Maintainer: xPsycho999 https://github.com/xPsycho999
pkgname=lofi-atc-mixer
pkgver=1.0
pkgrel=1
pkgdesc="Terminal TUI for Lofi, Live-ATC & Ambient Sounds with Cava visualizer"
arch=('any')
url="https://github.com/xPsycho999/lofi-atc-mixer"
license=('GPL3')
depends=('mpv' 'yt-dlp' 'fzf' 'socat' 'cava')

source=("$pkgname-$pkgver.tar.gz::https://github.com/xPsycho999/lofi-atc-mixer/archive/refs/tags/v1.0.tar.gz")
sha256sums=('0ab2debe69394a89938788cd5c93f2af3ffc310b94037fb823fcf4997ff52403')

package() {

    cd "$srcdir/lofi-atc-mixer-1.0"

    install -Dm755 lofi-atc.sh "$pkgdir/usr/bin/lofi-atc"
}
