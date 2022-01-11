# Maintainer: Bardia 'Luviz' Jedi <bardiajedi@gmail.com>

pkgname=html5videoplayer-git
pkgver=1.0.0
pkgrel=1
pkgdesc="HTML 5 video player. Just a video tag in a html file"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Luviz/html5videoplayer.git"
license=('MIT')

package() {
	git clone $url
	cd "$srcdir/html5videoplayer"

	ls

	install -Dm755 html5videoplayer "${pkgdir}/usr/bin/html5videoplayer"
	install -Dm666 video.html "${pkgdir}/usr/share/html5videoplayer/video.html"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}