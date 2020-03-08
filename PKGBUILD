# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.8.1
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
    yay
)

# Sources
source=(
	$pkgname-$pkgver-$pkgrel::$url/raw/v$pkgver/future-fetch
)
# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('55f7d60024dd3c8c77d4d2deb5c8ed1268f792cb2a4fee8a57e25621a282c3cdef9487c31a10ec1a5584e788c2d0abf849f9445e85f05d79731fc74a339f7a4f')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/future-fetch"
}
