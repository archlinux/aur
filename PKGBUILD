# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xscreensaver-aerial'
pkgver=1.03
pkgrel=1
arch=('any')
url="https://github.com/graysky2/xscreensaver-aerial"
license=('MIT')
pkgdesc='xscreensaver hack that randomly selects one of the Apple TV4 HD aerial movies'
depends=('xscreensaver' 'mpv')
optdepends=('xscreensaver-aerial-videos: pre-downloaded videos to save bandwidth')
install=readme.install
source=("https://github.com/graysky2/xscreensaver-aerial/archive/v$pkgver.tar.gz")
sha256sums=('bfcaafee9c7eb2b9648d024df953a47b02960c6ecb6f16e223e00c21fcdc2acb')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4.sh "${pkgdir}/usr/lib/xscreensaver/atv4"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
