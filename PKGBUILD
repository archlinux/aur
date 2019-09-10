# Maintainer: Mirza Baig <mirzabaig@protonmail.com>
pkgname=cropper
pkgver=1.2
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
    cd "$srcdir/${pkgname}-${pkgver}"
	install -D -m755 "cropper-$pkgver" "$pkgdir/usr/bin/cropper"
}
