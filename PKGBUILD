# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.2
pkgrel=1
pkgdesc="Simple fetch script"
arch=(x86_64)
url="https://git.auteiy.me/dmitry/futureFetch"
license=(MIT)
optdepends=(
    'pacman-contrib: Check updates'
)

# Sources
source=(
	$pkgname-$pkgver-$pkgrel::$url/raw/v$pkgver/ff
)
# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('a4664cb7172ba04756502cf2207c9f4b04dc0e0061217a1bc4f433d9e2ca2c8373e15ea402860386f8bf02b998942065627810c478ae4cfbcccbe72e02ae1e2b')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/ff"
}
