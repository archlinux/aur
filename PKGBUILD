# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xscreensaver-aerial'
pkgver=1.05
pkgrel=2
arch=('any')
url="https://github.com/graysky2/xscreensaver-aerial"
license=('MIT')
pkgdesc='xscreensaver hack that randomly selects one of the Apple TV4 HD aerial movies'
depends=('xscreensaver' 'mpv')
optdepends=('xscreensaver-aerial-videos: pre-downloaded videos to save bandwidth')
install=readme.install
source=("https://github.com/graysky2/xscreensaver-aerial/archive/v$pkgver.tar.gz")
sha256sums=('994361e1f8900b1679d51c36e6cf7bcbcb2778300be186862e32ad9721dc11c5')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4.sh "${pkgdir}/usr/lib/xscreensaver/atv4"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
