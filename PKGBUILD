# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.9.8
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
    psmisc
    util-linux
)

optdepends=(
    'yay: for counting AUR updates'
    'wmctrl: for displaying window manager in Xorg'
)

# Sources
source=(
	$pkgname-$pkgver-$pkgrel::$url/raw/v$pkgver/future-fetch
)
# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('b429dee3a792e114c67fcc4c6a65bc03eb142375fc12dc451163da26d738acd434fd898fbb4504c912e57e6a5d8ab623fbd91e37fb1b1049316bd7de3e18a8dd')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/future-fetch"
}
