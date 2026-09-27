# Maintainer: ThankfulKoala <archlinux.dastardly615@simplelogin.com>
pkgname=topowall
pkgver=0.3.0
pkgrel=1
pkgdesc="Topographic contour wallpapers from real elevation data, rendered on the GPU"
arch=('x86_64')
url="https://github.com/gonzalezerik/topowall"
license=('MIT')
depends=('glibc>=2.35' 'libgcc')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gonzalezerik/topowall/releases/download/v$pkgver/topowall-$arch-unknown-linux-gnu.tar.gz")
sha256sums=('21482127d24f1c2088057435b578a5f5c546fb13cf30b2b07d1d8dc7f4fa04cb')

package() {
	cd "$pkgname-$arch-unknown-linux-gnu"
	install -Dm755 ./topowall "$pkgdir/usr/bin/topowall"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
