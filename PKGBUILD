# Maintainer: Ann Naser Nabil <ann.n.nabil@gmail.com>
# Contributor: Ann Naser Nabil

pkgname=ytm
pkgver=1.0.0
pkgrel=2
pkgdesc="CLI YouTube Music Player - search, queue, and play audio via mpv + yt-dlp"
arch=('any')
url="https://github.com/nabil0x/ytm_cli"
license=('MIT')
depends=('mpv' 'yt-dlp' 'python')
optdepends=('fzf: interactive search result selection'
            'ffmpeg: terminal ANSI video playback (watch command)'
            'python-pillow: TUI cover art thumbnails')
source=("ytm" "LICENSE")
sha256sums=('a2d9e43456ee0af560e37e67493cf0a7836877d6f4355aad59ab3243aa4e636e'
            '104f5a811552fe6f2ad0706c28d08d8f1ee43d42b035d9469dd8462c84494f23')

package() {
  install -Dm755 "$srcdir/ytm" "$pkgdir/usr/bin/ytm"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
