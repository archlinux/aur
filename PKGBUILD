# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.9
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
sha512sums=('84a6ce7f5e45299482fc472b8d0099a20dbd9d35bd1cb79081fff9fa2d909dffb3f6ad78e61b683225a694f2f2ee98c91ae21d731c8ccf0da66701df4def571e')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/future-fetch"
}
