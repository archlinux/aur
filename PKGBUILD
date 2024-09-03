pkgname=chromap
chromap_ver=0.2.6
pkgver=$chromap_ver
pkgrel=4
pkgdesc="An ultrafast method for aligning and preprocessing high throughput chromatin profiles. "
arch=('x86_64')
license=('custom:"Copyright (c) 2019 Haowen Zhang, Li Song, X. Shirley Liu, Heng Li"')
url="https://haowenz.github.io/chromap/"
depends=()
provides=("$pkgname")
conflicts=("$pkgname")
optdepends=()

file_name=${pkgname}-${pkgver}_x64-linux.tar.bz2
source=(
	"https://gh.api.99988866.xyz/https://github.com/haowenz/chromap/releases/download/v${pkgver}/$file_name"
)

chromap_sum=
sha512sums=(
	$chromap_sum
)

package() {
	export LC_ALL=en_US.UTF-8

	mkdir -p "$pkgdir/usr/bin"
	tar -xf $file_name -C "$pkgdir/usr/bin"
}
