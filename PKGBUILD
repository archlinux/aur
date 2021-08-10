# Maintainer: Bruno Felipe Leal Delfino <bruno.delfino1995@gmail.com>

pkgname='kct-bin'
pkgver=0.3.1
pkgrel=1
arch=('x86_64')
url='https://github.com/kseat/kct'
pkgdesc='A Kubernetes Configuration Tool'
license=('MIT')
provides=('kct')
conflicts=('kct-git' 'kct')
source_x86_64=("$pkgname::https://github.com/kseat/kct/releases/download/v$pkgver/kct-linux-amd64"
	'LICENSE')
sha256sums_x86_64=('c6330d0aa1f01b6cb1a82bdbafec3c51416d7289062177d0c34de47a3dc32378'
	'667f2ea4a8f2f52c985005af28cf95a52021f3931cb7d2f25387d87b092fecc3')

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/kct"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
