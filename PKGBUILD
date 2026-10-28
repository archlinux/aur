pkgname=goanime
pkgver=2.0.0
pkgrel=1
pkgdesc="Search, stream and download anime, movies and TV shows from the terminal"
arch=('x86_64')
url="https://github.com/alvarorichard/GoAnime"
license=('MIT')
depends=('mpv')
optdepends=('ffmpeg: embed subtitles in downloads and upscale videos'
            'discord: Discord Rich Presence')
source=("${pkgname}-${pkgver}::https://github.com/alvarorichard/GoAnime/releases/download/v${pkgver}/goanime-linux-amd64")
sha256sums=('321b4462c28af6fb56d952839791d4e3225f1a312634089d6b26741a1e14656f')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/goanime"
}
