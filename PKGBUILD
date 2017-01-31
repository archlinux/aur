# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xscreensaver-aerial'
pkgver=1.06
pkgrel=1
arch=('any')
url="https://github.com/graysky2/xscreensaver-aerial"
license=('MIT')
pkgdesc='xscreensaver hack that randomly selects one of the Apple TV4 HD aerial movies'
depends=('xscreensaver' 'mpv')
optdepends=('xscreensaver-aerial-videos: pre-downloaded videos to save bandwidth')
install=readme.install
source=("https://github.com/graysky2/xscreensaver-aerial/archive/v$pkgver.tar.gz")
sha256sums=('2ea08b09377853d7fe58a5d29aad2411abc71368d4735e5cfe1f4c5195ff2636')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4.sh "${pkgdir}/usr/lib/xscreensaver/atv4"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
