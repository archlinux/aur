# Maintainer: Mumulhl <mumulhl.666@gmail.com>
pkgname="yt-music-archive"
pkgver="0.1.0"
pkgrel=1
pkgdesc="Download youtube music locally and store its id in a archive file, and restore the music from this file."
arch=(any)
url="https://github.com/mumu-lhl/yt-music-archive"
license=("MIT")
depends=("yt-dlp")
backup=("etc/yt-music-archive/yt-music-archive.conf")
source=("https://github.com/mumu-lhl/yt-music-archive/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eb6f5aa9a3cb0cbde747181dc95f5a86e6f318c06aa97e210ea37ac6cd6756c2')

package() {
	_srcdir="${srcdir}/yt-music-archive-${pkgver}"
	install -Dm755 "${_srcdir}/yt-music-archive" "${pkgdir}/usr/bin/yt-music-archive"
	install -Dm755 "${_srcdir}/yt-music-archive.conf" "${pkgdir}/etc/yt-music-archive/yt-music-archive.conf"
	install -Dm644 "${_srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/yt-music-archive/LICENSE"
}
