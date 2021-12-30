# Maintainer: Gabriel Matthews <matthewriel63@gmail.com>

pkgname='yt-watch'
pkgver=2.3
pkgrel=1
pkgdesc="Search/Watch/Download/Convert YouTube Videos on mpv using yt-dlp/YouTube API."
arch=('any')
url="https://github.com/Kungger-git/yt-watch"
license=('GPL3')
depends=('jq' 'mpv' 'curl' 'xclip' 'yt-dlp')

source=('yt-watch')
sha256sums=('687cb577c3244612412b0c9cb9d87abc6991b07b3207b5b9b867edc728e53166')

package() {
	install -dm755 ${pkgdir}/usr/bin
	install -Dm 755 ${srcdir}/yt-watch ${pkgdir}/usr/bin
}
