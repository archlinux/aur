# Maintainer: spaciousejar <thedarkspacian@proton.me>

pkgname=vicine
pkgver=1.5.1
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
sha256sums=('324783d08294f1ee8e19113c220158510c7a5295d569db8f8cc6f251f8a96bb0')

package() {
    install -Dm755 "vicine-cli-${pkgver}/vicine" "${pkgdir}/usr/bin/vicine"
}
