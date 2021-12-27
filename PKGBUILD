# Maintainer: Gabriel Matthews <matthewriel63@gmail.com>

pkgname='yt-watch'
pkgver=1.8
pkgrel=1
pkgdesc="Search/Watch/Download/Convert YouTube Videos on mpv using yt-dlp/YouTube API."
arch=('any')
url="https://github.com/Kungger-git/yt-watch"
license=('GPL3')
depends=('jq' 'mpv' 'curl' 'xclip' 'yt-dlp')

package() {
	install -dm755 ${pkgdir}/usr/bin
	install -Dm 755 ../yt-watch ${pkgdir}/usr/bin
}
