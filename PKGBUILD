# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.9.7.7
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
sha512sums=('661895cae90f1e0a21dc299ea7be4a626b3e38fa01f4180807edb8685123f11100259191d7507889b694493aa75bd1028413fb775599a37e6fdd597928c5fb57')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/future-fetch"
}
