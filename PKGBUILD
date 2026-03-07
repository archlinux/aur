# Maintainer: Ali Abdelwahab <aliabdoxd14@gmail.com>
pkgname=ani-stream
pkgver=3.1.1
pkgrel=1
pkgdesc="A lightweight CLI tool to stream and download anime from the terminal"
arch=('any')
url="https://github.com/aliabdoxd27-source/ani-stream"
license=('MIT')
depends=('curl' 'fzf' 'mpv')
optdepends=('yt-dlp: for HLS stream downloads'
            'ffmpeg: alternative for downloads'
            'aria2: for faster downloads'
            'rofi: for rofi-based menu selection'
            'ani-skip: for skipping intros')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  
  install -Dm755 ani-stream "${pkgdir}/usr/bin/ani-stream"
  install -Dm644 LISENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
