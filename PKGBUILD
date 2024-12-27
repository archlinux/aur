pkgname=chromap
chromap_ver=0.2.7
pkgver=$chromap_ver
pkgrel=1
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

chromap_sum=5f8090c83e0aece3abc954dcc7ae5c80cd3e509d6c9922c6a41d35aa1e8c0b7ffabc52bedc538b86396538b646be564739e9fc04cdbfe2c34b658c9de44b4b66
sha512sums=(
	$chromap_sum
)

package() {
	export LC_ALL=en_US.UTF-8

	mkdir -p "$pkgdir/usr/bin"
	tar -xf $file_name -C "$pkgdir/usr/bin"
}
