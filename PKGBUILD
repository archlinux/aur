# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: ffqq <shuttara@gmail.com>

pkgname=liteaur
pkgver=1.7.2
pkgrel=1
pkgdesc="Shell-based AUR helper"
arch=('any')
url="https://gitea.com/ffqq/liteaur"
license=('GPL3')
depends=('git' 'jq' 'pacman')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d0e7656420414490db3c80511dbec56af92d87b09c3caae42a40a286f98c0501')

package() {
	cd "$pkgname"
	install -D "$pkgname" -t "$pkgdir/usr/bin/"
}
