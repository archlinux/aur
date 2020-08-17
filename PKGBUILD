# Maintainer: Gauge Krahe <gauge.krahe at gmail dot com>

pkgname=scr
pkgver=2.1
pkgrel=1
pkgdesc="A ffmpeg recording script"
arch=(any)
url="https://github.com/6gk/$pkgname"
license=('ISC')
makedepends=('git')
depends=('ffmpeg' 'procps-ng' 'slop')
optdepends=('mmutils-git' 'xclip' 'wmutils-git' 'dmenu' 'rofi')
provides=("$pkgname")

source=("$pkgname::git+https://github.com/6gk/$pkgname")
md5sums=('SKIP')

package () {
	cd "$srcdir/$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
