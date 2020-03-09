# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=future-fetch
pkgver=0.9.4
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
sha512sums=('90cef9a7d97423bdc688af74ff4a0a00bc54ec3c1bcf8e7726ed3995c8ee43abc2d346c1708dca563233ccb30df208458b15dbc77b151e8507086fc4da65690d')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/future-fetch"
}
