# Maintainer: Gabriel Matthews <matthewriel63@gmail.com>

pkgname='yt-watch'
pkgver=3.0
pkgrel=1
pkgdesc="Search/Watch/Download/Convert YouTube Videos on mpv using yt-dlp/YouTube API."
arch=('any')
url="https://github.com/Kungger-git/yt-watch"
license=('GPL3')
depends=('jq' 'mpv' 'curl' 'xclip' 'yt-dlp')

source=('yt-watch')
sha256sums=('5f9ce96c4df8f032f5425a0aabcc95324e9b846ff9e1f7cf8a617e8f7d9f4ea7')

package() {
	install -dm755 ${pkgdir}/usr/bin
	install -Dm 755 ${srcdir}/yt-watch ${pkgdir}/usr/bin
}
