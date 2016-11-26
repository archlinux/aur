# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xscreensaver-aerial'
pkgver=1.04
pkgrel=1
arch=('any')
url="https://github.com/graysky2/xscreensaver-aerial"
license=('MIT')
pkgdesc='xscreensaver hack that randomly selects one of the Apple TV4 HD aerial movies'
depends=('xscreensaver' 'mpv')
optdepends=('xscreensaver-aerial-videos: pre-downloaded videos to save bandwidth')
install=readme.install
source=("https://github.com/graysky2/xscreensaver-aerial/archive/v$pkgver.tar.gz")
sha256sums=('3278b13c4d7b0fa974e7f72bca4398bc73950f64822a461971702c71ea8fec2d')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4.sh "${pkgdir}/usr/lib/xscreensaver/atv4"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
