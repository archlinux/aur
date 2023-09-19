# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

pkgname=yamlfmt
pkgver=0.10.0
pkgrel=2
pkgdesc='An extensible command line tool or library to format yaml files.'
arch=('x86_64')
url='https://github.com/google/yamlfmt'
license=(Apache 2.0)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/yamlfmt/releases/download/v0.10.0/yamlfmt_0.10.0_Linux_x86_64.tar.gz")
md5sums=('3cea7acf405854434a3345f6d9434292')

package() {
	install -Dm755 "$srcdir/yamlfmt" "$pkgdir/usr/bin/yamlfmt"
}
