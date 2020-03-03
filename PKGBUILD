# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=kwin-scripts-forceblur
pkgver=0.4.1
pkgrel=1
pkgdesc="Force-enable blur effect to user-specified windows"
arch=(any)
url='https://github.com/esjeon/kwin-forceblur'
license=(MIT)
depends=(kwin)
source=("$url/releases/download/v$pkgver/forceblur-$pkgver.kwinscript")
sha256sums=('45a383710fa464d32915060173080224e5c482eb387fe5924a8d6b31c24a1271')

package() {
	install -d "$pkgdir/usr/share/kwin/scripts/forceblur"
	cp -r bin/ contents/ LICENSE image.png metadata.desktop "$pkgdir/usr/share/kwin/scripts/forceblur/"
	install -Dm644 metadata.desktop "$pkgdir/usr/share/kservices5/kwin-script-forceblur.desktop"
}
