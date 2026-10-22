# Maintainer: spaciousejar <thedarkspacian@proton.me>

pkgname=vicine
pkgver=1.7.3
pkgrel=2
pkgdesc="Search, stream, and download movies, series and anime from the terminal (POSIX shell)"
arch=('any')
url="https://github.com/spaciousejar/vicine-cli"
license=('GPL-3.0-or-later')
depends=('curl' 'jq' 'fzf' 'mpv' 'yt-dlp')
optdepends=('vlc: alternative player'
            'ffmpeg: fallback downloader when yt-dlp is absent'
            'rofi: alternative selection menu'
            'dmenu: alternative selection menu')
source=("https://github.com/spaciousejar/vicine-cli/archive/v${pkgver}.tar.gz")
sha256sums=('5373baab9e1322320441faea353e997760a5f6928aba5e0b9225104caadb0408')

package() {
    install -Dm755 "vicine-cli-${pkgver}/vicine" "${pkgdir}/usr/bin/vicine"
}
