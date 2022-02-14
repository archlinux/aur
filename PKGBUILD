# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=kwin-scripts-forceblur
pkgver=0.6.1
pkgrel=1
pkgdesc="Force-enable blur effect to user-specified windows"
arch=(any)
url='https://github.com/esjeon/kwin-forceblur'
license=(MIT)
depends=(kwin)
source=("kwin-forceblur-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5c437aedef9b40ead9d26141aa9482227a0554f202e13f7b8754529587298412')

package() {
	cd "kwin-forceblur-$pkgver"
	install -d "$pkgdir/usr/share/kwin/scripts/forceblur"
	cp -r contents/ LICENSE image.png metadata.desktop "$pkgdir/usr/share/kwin/scripts/forceblur/"
	install -Dm644 metadata.desktop "$pkgdir/usr/share/kservices5/kwin-script-forceblur.desktop"
}
