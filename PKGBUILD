# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.7
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
	$pkgname-$pkgver-$pkgrel::$url/raw/v$pkgver/future-fetch
)
# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('25399b5ae3a3cf7727fdc507cf4aea25702087f3fd04ba17326026d19de85520b9a54767eedb6a0d6141ed320e8e35652c0204fec0c1741e4ec6d61784de0854')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/future-fetch"
}
