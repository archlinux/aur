# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=poop-bin
_pkgname=${pkgname%-bin}
pkgver=0.5.0
pkgrel=1
pkgdesc="Performance Optimizer Observation Platform"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/andrewrk/$_pkgname"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$CARCH-linux-$_pkgname")
sha256sums=('8384e7089530ec993b9fdb13f5164f0028fb9b67a55bcd9afcfb2ef42fc8d700')

package() {
	install -Dm755 "$CARCH-linux-$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
