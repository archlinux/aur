# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.5.2
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
sha512sums=('1c1940c6d306ef35e48eed5bb6bd159bfeb8b06462e5873abafa34b17cb9cdf73d1b30ae62ef71288eb4c4b7f9157c4e7ff0eca105fbf82430c1911aaf24142c')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/ff"
}
