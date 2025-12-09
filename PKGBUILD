# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-screenshot
pkgver=1.0.0
pkgrel=2
pkgdesc="Simple script helper to take screenshots with \`lqth\`"
arch=('any')
url="https://github.com/archy-linux/archy-screenshot"
license=('MIT')
groups=('archy-utils')
depends=('lqth' 'xrectsel' 'xdo' 'farbfeld')
optdepends=()
provides=('screenshot')
options=()
source=("https://github.com/archy-linux/$pkgname/archive/refs/tags/$pkgname_$pkgver.tar.gz")
sha256sums=('9218e9e4a322492b023e01af91fd6c78442329c8c17c4ac57c0168e139218a49')
# validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 screenshot.sh "$pkgdir/usr/bin/screenshot"
}
