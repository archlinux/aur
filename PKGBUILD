pkgname='kct-bin'
_pkgname='kct'
pkgver=0.2.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kseat/kct"
pkgdesc="A Kubernetes Configuration Tool"
license=('MIT')
provides=('kct')
conflicts=('kct')
source_x86_64=("$_pkgname::https://github.com/kseat/kct/releases/download/v$pkgver/kct-linux-amd64")
sha256sums_x86_64=('87f7dbe30b60375b1546c3eb9d289ef204ebcfa113377aca5ede5acf8e09ed6b')

package() {
	install -D -m755 "$_pkgname" "$pkgdir/usr/bin/kct"
}
