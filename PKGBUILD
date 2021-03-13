# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Contributor: ZenQy <zenqy.qin@gmail.com>

pkgname=i3-get-window-criteria
pkgver=git
pkgrel=4
epoch=1
pkgdesc="Get criteria for use with i3 config commands"
arch=('any')
url="https://gist.github.com/AriaMoradi/d9eaa97538281d0f7158b036288732e1"
license=('custom')
depends=('xorg-xwininfo' 'xorg-xprop')
makedepends=('git')

source=("${pkgname}::git+https://gist.github.com/d9eaa97538281d0f7158b036288732e1.git")

md5sums=(SKIP)

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 i3-get-window-criteria "$pkgdir/usr/bin/$pkgname"
}
