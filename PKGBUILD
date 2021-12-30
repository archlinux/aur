# Maintainer: Gabriel Matthews <matthewriel63@gmail.com>

pkgname='yt-watch'
pkgver=2.6
pkgrel=1
pkgdesc="Search/Watch/Download/Convert YouTube Videos on mpv using yt-dlp/YouTube API."
arch=('any')
url="https://github.com/Kungger-git/yt-watch"
license=('GPL3')
depends=('jq' 'mpv' 'curl' 'xclip' 'yt-dlp')

source=('yt-watch')
sha256sums=('1875d4b92ffd2695e45db5095cebd23e1bdbd9f99b3b8e2df109651ac2e579b9')

package() {
	install -dm755 ${pkgdir}/usr/bin
	install -Dm 755 ${srcdir}/yt-watch ${pkgdir}/usr/bin
}
