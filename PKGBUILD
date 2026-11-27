pkgname=goanime
pkgver=2.0.4
pkgrel=1
pkgdesc="Search, stream and download anime, movies and TV shows from the terminal"
arch=('x86_64')
url="https://github.com/alvarorichard/GoAnime"
license=('MIT')
depends=('mpv')
optdepends=('ffmpeg: embed subtitles in downloads and upscale videos'
            'discord: Discord Rich Presence')
source=("${pkgname}-${pkgver}::https://github.com/alvarorichard/GoAnime/releases/download/v${pkgver}/goanime-linux-amd64")
sha256sums=('c27ab8e60cf7d0580b5b6f78307d966a48e8e960341de4b84c5414c9baff48bf')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/goanime"
}
