# Maintainer: Gabriel Matthews <matthewriel63@gmail.com>

pkgname=yt-watch
_destname1="/usr/bin"
pkgver=1.0
pkgrel=1
pkgdesc="Search/Watch/Download/Convert YouTube Videos on mpv using yt-dlp/YouTube API."
arch=('any')
url="https://github.com/zone-linux/zone-pkgbuild/tree/master/local_pkgbuild/yt-watch"
license=('MIT')
depends=('jq' 'mpv' 'curl' 'xclip' 'yt-dlp')
provides=("${pkgname}")
options=(!strip !emptydirs)

package() {
	install -dm755 ${pkgdir}${_destname1}
	install -Dm 755 ../yt-watch ${pkgdir}${_destname1}
}
