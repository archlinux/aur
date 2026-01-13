pkgname=ytd-lkml
pkgver=0.2.1
pkgrel=1
pkgdesc="Terminal YouTube downloader with TUI (yt-dlp wrapper)"
arch=('any')
url="https://github.com/tharidul/ytd"
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
optdepends=('gum: interactive TUI')
source=("https://raw.githubusercontent.com/tharidul/ytd/v${pkgver}/ytd")
sha256sums=('SKIP')

package() {
  install -Dm755 ytd "$pkgdir/usr/bin/ytd"
}
