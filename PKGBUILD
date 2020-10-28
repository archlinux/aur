pkgname='kct-bin'
_pkgname='kct'
pkgver=0.2.0
pkgrel=2
arch=('x86_64')
url='https://github.com/kseat/kct'
pkgdesc='A Kubernetes Configuration Tool'
license=('MIT')
provides=('kct')
conflicts=('kct')
source_x86_64=("$_pkgname::https://github.com/kseat/kct/releases/download/v$pkgver/kct-linux-amd64"
	'LICENSE')
sha256sums_x86_64=('87f7dbe30b60375b1546c3eb9d289ef204ebcfa113377aca5ede5acf8e09ed6b'
	'667f2ea4a8f2f52c985005af28cf95a52021f3931cb7d2f25387d87b092fecc3')

package() {
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/kct"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
