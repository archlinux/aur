# Contributor: 100best
pkgname=iceweasel-html5-video-everywhere
_pkgname=html5_video_everywhere
pkgver=0.4.8
pkgrel=1
pkgdesc="Replace video player with native HTML5 video player"
arch=(any)
url=https://addons.mozilla.org/en-US/firefox/addon/html5-video-everywhere/
license=(GPL3)
depends=(iceweasel)
source=(https://addons.mozilla.org/firefox/downloads/file/814061/$_pkgname-$pkgver-an+fx.xpi)
noextract=($_pkgname-$pkgver-an+fx.xpi)
sha256sums=(656d636b91b38175d88938418be8f098d69502d2f7d417e698991ced60b6f80e)

package() {
mv $_pkgname-$pkgver-an+fx.xpi html5-video-everywhere@lejenome.me.xpi
mkdir -p $pkgdir/usr/lib/iceweasel/browser/extensions/
install html5-video-everywhere@lejenome.me.xpi $pkgdir/usr/lib/iceweasel/browser/extensions/
}
