# Maintainer: spaciousejar <thedarkspacian@proton.me>

pkgname=vicine
pkgver=1.7.1
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
sha256sums=('ef4cda057ab7a0b1d060ddeaf7e95a9c6ddc4721ed3876474bfafe7be96b944e')

package() {
    install -Dm755 "vicine-cli-${pkgver}/vicine" "${pkgdir}/usr/bin/vicine"
}
