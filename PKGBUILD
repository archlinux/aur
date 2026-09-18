# Maintainer: spaciousejar <thedarkspacian@proton.me>

pkgname=vicine
pkgver=1.3.0
pkgrel=3
pkgdesc="Search, stream, and download movies, series and anime from the terminal (POSIX shell)"
arch=('any')
url="https://github.com/spaciousejar/vicine-cli"
license=('GPL-3.0-or-later')
depends=('curl' 'jq' 'fzf' 'mpv')
optdepends=('vlc: alternative player'
            'yt-dlp: fast multi-connection downloads'
            'ffmpeg: fallback downloader when yt-dlp is absent'
            'rofi: alternative selection menu'
            'dmenu: alternative selection menu')
source=("https://github.com/spaciousejar/vicine-cli/archive/v${pkgver}.tar.gz")
sha256sums=('772b4f466f6ec39f1a1b670daa333806f12e57a37760a5c08d5f40f79613efc5')

package() {
    install -Dm755 "vicine-cli-${pkgver}/vicine" "${pkgdir}/usr/bin/vicine"
}