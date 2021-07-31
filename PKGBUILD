# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=gopass-jsonapi-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="Gopass Browser Bindings"
arch=(x86_64)
url="https://github.com/gopasspw/gopass-jsonapi"
license=('MIT')

conflicts=('gopass-jsonapi')
provides=('gopass-jsonapi')

source=("https://github.com/gopasspw/gopass-jsonapi/releases/download/v${pkgver}/gopass-jsonapi-${pkgver}-linux-amd64.tar.gz")

sha256sums=('11fbc59afa6a4ca6385974bdded34adc38dfc6837ab7297b106d012029cdbb19')

package() {
	# package
	install -D -m755 $srcdir/gopass-jsonapi $pkgdir/usr/bin/gopass-jsonapi
}
