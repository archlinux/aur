# Maintainer: Egor Gushcha <egorts04@gmail.com> 
pkgname=pacproxy
pkgver=2.0.0
pkgrel=1
pkgdesc="A no-frills local HTTP proxy server powered by a proxy auto-config (PAC) file"
arch=('x86_64')
license=('Apache')
source=(
	"https://github.com/williambailey/$pkgname/releases/download/v$pkgver/pacproxy"_"$pkgver"_"linux_amd64.tar.gz"
)

sha256sums=(
	'93e8d59952d6221172dd493e386cfdc88a5464c5475d87a1b4e1a5e87590d667'
)

build() {
	tar xf $pkgname"_"$pkgver"_"linux_amd64.tar.gz
}

package() {
	cd "$pkgname"_"$pkgver"_"linux_amd64"
	install -D $pkgname "$pkgdir/usr/bin/pacproxy"
}
