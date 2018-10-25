# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xscreensaver-aerial'
pkgver=1.09
pkgrel=1
arch=('any')
url="https://github.com/graysky2/xscreensaver-aerial"
license=('MIT')
pkgdesc='xscreensaver hack that randomly selects one of the Apple TV4 HD aerial movies'
depends=('xscreensaver' 'mpv' 'wget')
optdepends=('xscreensaver-aerial-videos: pre-downloaded videos to save bandwidth')
install=readme.install
source=("https://github.com/graysky2/xscreensaver-aerial/archive/v$pkgver.tar.gz")
sha256sums=('3089fd2a739d784bef41f93301d4b4ce0fcf4e3f88a2a7a7cea18fe04f581ca7')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4-1080.sh "${pkgdir}/usr/lib/xscreensaver/atv4-1080"
	install -Dm755 atv4-4k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-4k"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
