# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=kwin-scripts-forceblur
pkgver=0.3
pkgrel=1
pkgdesc="Force-enable blur effect to user-specified windows"
arch=(any)
url='https://github.com/esjeon/kwin-forceblur'
license=(MIT)
depends=(kwin)
source=("$url/releases/download/v$pkgver/forceblur-$pkgver.kwinscript")
sha256sums=('4f6deaed25c2ee2fa6abd63dff93b354f4fd4bf17a17d0e596df0268ad589ca2')

package() {
	install -d "$pkgdir/usr/share/kwin/scripts/forceblur"
	cp -r bin/ contents/ LICENSE image.png metadata.desktop "$pkgdir/usr/share/kwin/scripts/forceblur/"
	install -Dm644 metadata.desktop "$pkgdir/usr/share/kservices5/kwin-script-forceblur.desktop"
}
