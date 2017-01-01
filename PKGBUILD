# Maintainer: Declan Hoare <declanhoare at exemail dot com dot au>
pkgname=supergzdoom
pkgver=1.0
pkgrel=1
pkgdesc="WAD selector for gzdoom"
arch=('any')
url="https://github.com/RogueAI42/supergzdoom"
license=('GPL3')
depends=('bash' 'zenity' 'gzdoom')
source=("supergzdoom-1.0.tar.gz::https://github.com/RogueAI42/supergzdoom/archive/v1.0.tar.gz")
md5sums=('66bd8fdba5111111fc4597106314e85a')
sha1sums=('0dbb0851b27e73cd4dadd3116ee1758a5ba67787')
sha224sums=('d1f5faabb2e6183b7c7c94ec135b8e34bf45ed58857ffff604d76af2')
sha256sums=('e2e61ee04a17ff4527b9229adf249c696c2ae696127826abee44232fb2e0db91')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp supergzdoom "$pkgdir/usr/bin"
}
