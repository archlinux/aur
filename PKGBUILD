
# Maintainer: xPsycho999 https://github.com/xPsycho999
pkgname=lofi-atc-mixer
pkgver=1.1
pkgrel=1
pkgdesc="Terminal TUI for Lofi, Live-ATC & Ambient Sounds with Cava visualizer"
arch=('any')
url="https://github.com/xPsycho999/lofi-atc-mixer"
license=('GPL3')
depends=('mpv' 'yt-dlp' 'fzf' 'socat' 'cava')

source=("$pkgname-$pkgver.tar.gz::https://github.com/xPsycho999/lofi-atc-mixer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f79a9a9fd381031bbd11c38cb55e847c695e207e99f9aed8fde80b855df9066')

package() {

    cd "$srcdir/lofi-atc-mixer-$pkgver"

    install -Dm755 lofi-atc.sh "$pkgdir/usr/bin/lofi-atc"
}
