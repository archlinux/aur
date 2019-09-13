# Maintainer: Mirza Baig <mirzabaig@protonmail.com>
pkgname=cropper-git
pkgver=2.0
pkgrel=1
pkgdesc="A TUI to trim video files within a specified range given start and end times."
arch=('any')
url="https://github.com/sulchz/cropper/"
license=('unknown')
depends=('dateutils' 'ffmpeg' 'libnewt')
makedepends=('git')
source=('git://github.com/sulchz/cropper.git')
sha256sums=('SKIP')

package() {
    cd "$srcdir/cropper"
	install -D -m755 "cropper" "$pkgdir/usr/bin/cropper"
}
