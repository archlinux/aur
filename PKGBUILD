# Maintainer: Gabriel Matthews <matthewriel63@gmail.com>

pkgname='yt-watch'
pkgver=2.7
pkgrel=1
pkgdesc="Search/Watch/Download/Convert YouTube Videos on mpv using yt-dlp/YouTube API."
arch=('any')
url="https://github.com/Kungger-git/yt-watch"
license=('GPL3')
depends=('jq' 'mpv' 'curl' 'xclip' 'yt-dlp')

source=('yt-watch')
sha256sums=('373be46eb24dbbfd2ccf73332d069c24162b90dc0c50d85964ff507d8c28d955')

package() {
	install -dm755 ${pkgdir}/usr/bin
	install -Dm 755 ${srcdir}/yt-watch ${pkgdir}/usr/bin
}
