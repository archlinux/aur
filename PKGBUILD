# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.9.2
pkgrel=1
pkgdesc="Simple fetch script"
arch=(x86_64)
url="https://git.auteiy.me/dmitry/futureFetch"
license=(MIT)
depends=(
    coreutils
    findutils
    gawk
    pacman
    pacman-contrib
    procps-ng
    util-linux
)

optdepends=(
    'yay: for counting AUR updates'
)

# Sources
source=(
	$pkgname-$pkgver-$pkgrel::$url/raw/v$pkgver/future-fetch
)
# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('fb6d67ba4f5037a408dc64b997684dcdf4ce0b24e59c9646ca4e4aadfc648a28375992df8df4b13c372e01a73362458f3d21bb64eb3d1017c8970e4e2f8f0930')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/future-fetch"
}
