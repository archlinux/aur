# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=peafox
pkgver=79.0a1
pkgrel=0.1
pkgdesc="Firefox fork hardened by default and without the telemetry."
arch=('any')
url="https://github.com/peacockweb/peafox"
license=('MPL-2.0')
depends=()
source=("https://github.com/peacockweb/peafox/releases/download/v"$pkgrel"/"$pkgname"_"$pkgver".deb")
noextract=('$pkgname_$pkgver.deb')
md5sums=('SKIP')

package() {
	ar -xvf "$pkgname"_"$pkgver".deb
	tar -xvf "$srcdir"/data.tar.xz -C "$pkgdir"
}
