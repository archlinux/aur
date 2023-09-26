# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
# shellcheck disable=SC2034,2154
pkgname=lemonade-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Lemonade is a remote utility tool. (copy, paste and open browser) over TCP"
arch=('x86_64')
url="https://github.com/lemonade-command/lemonade"
license=('MIT')
optdepends=(
	'xsel: X11 clipboard support on server'
	'xclip: X11 clipboard support on server'
	'wl-clipboard: Wayland clipboard support on server'
)
source=("https://github.com/lemonade-command/lemonade/releases/download/v$pkgver/lemonade_linux_amd64.tar.gz")
b2sums=('afb046b96bb5d575662f8982e21063c2d5e8d49d97225618fa612d50435055354d440ea27d17e9e8bf349185c5f20e7705deb5b91f9a46ef4f02d40a401f06dd')

package() {
	install -Dm755 "$srcdir/lemonade" "$pkgdir/usr/bin/lemonade"
}
