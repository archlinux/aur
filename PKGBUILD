# Maintainer: spaciousejar <thedarkspacian@proton.me>

pkgname=vicine
pkgver=1.9.0
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
sha256sums=('13c6208d0d391ed9cc07079c52a71439441ca40c7c25a0affaa808795609f101')

package() {
    install -Dm755 "vicine-cli-${pkgver}/vicine" "${pkgdir}/usr/bin/vicine"
}
