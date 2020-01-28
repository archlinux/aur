# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.3
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
sha512sums=('adf1d1efd4dbd6c838913490b98b957e6a51e76136a8fa431691cb4a6174bc6b71536aff2741020a3c502e913608b76ae648417d51a25e5c8152ba074c7473d6')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/ff"
}
