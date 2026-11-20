pkgname=goanime
pkgver=2.0.1
pkgrel=1
pkgdesc="Search, stream and download anime, movies and TV shows from the terminal"
arch=('x86_64')
url="https://github.com/alvarorichard/GoAnime"
license=('MIT')
depends=('mpv')
optdepends=('ffmpeg: embed subtitles in downloads and upscale videos'
            'discord: Discord Rich Presence')
source=("${pkgname}-${pkgver}::https://github.com/alvarorichard/GoAnime/releases/download/v${pkgver}/goanime-linux-amd64")
sha256sums=('5e89493f388d1cd7f622b1ce080866ebc38d5ec482b30cf848ae5ba5d02a681a')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/goanime"
}
