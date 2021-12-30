# Maintainer: Gabriel Matthews <matthewriel63@gmail.com>

pkgname='yt-watch'
pkgver=2.0
pkgrel=1
pkgdesc="Search/Watch/Download/Convert YouTube Videos on mpv using yt-dlp/YouTube API."
arch=('any')
url="https://github.com/Kungger-git/yt-watch"
license=('GPL3')
depends=('jq' 'mpv' 'curl' 'xclip' 'yt-dlp')

source=('yt-watch')
sha256sums=('a163847d4ae4e0db0aeffe7929b4a8c06df5a58603e137477bff13a17d87ad13')

package() {
	install -dm755 ${pkgdir}/usr/bin
	install -Dm 755 ${srcdir}/yt-watch ${pkgdir}/usr/bin
}
