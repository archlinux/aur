# Maintainer: numToStr <sudo@vikasraj.dev>

pkgname=snm
pkgver=v0.1.6
pkgrel=1
pkgdesc="Smol Node Manager written in Rust"
arch=('x86_64' 'aarch64' 'armv7')
url=https://github.com/numToStr/snm
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)

source_x86_64=(
    "$url/releases/download/v$pkgver/$pkgname-x86_64-unknown-linux-gnu.tar.gz"
)
md5sums_x86_64=(SKIP)

source_armv7=(
    "$url/releases/download/v$pkgver/$pkgname-armv7-unknown-linux-gnueabihf.tar.gz"
)
md5sums_armv7=(SKIP)

source_aarch64=(
    "$url/releases/download/v$pkgver/$pkgname-aarch64-unknown-linux-gnu.tar.gz"
)
md5sums_aarch64=(SKIP)

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
