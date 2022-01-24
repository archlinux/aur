# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: ffqq <shuttara@gmail.com>

pkgname=liteaur
pkgver=1.7.1
pkgrel=1
pkgdesc="Shell-based AUR helper"
arch=('any')
url="https://gitea.com/ffqq/liteaur"
license=('GPL3')
depends=('git' 'jq' 'pacman')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('771e9e77c5ecb55b4d1c20a2be7b597bd116969caa6acf7d282da6739fd663da')

package() {
	cd "$pkgname"
	install -D "$pkgname" -t "$pkgdir/usr/bin/"
}
