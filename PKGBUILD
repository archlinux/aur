# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

pkgname=yamlfmt
pkgver=0.9.0
pkgrel=1
pkgdesc='An extensible command line tool or library to format yaml files.'
arch=('x86_64')
url='https://github.com/google/yamlfmt'
license=(Apache 2.0)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/yamlfmt/releases/download/v0.9.0/yamlfmt_0.9.0_Linux_x86_64.tar.gz")
md5sums=('e080ef0fd72c808b6463dae6565466c0')

package() {
	install -Dm755 "$srcdir/yamlfmt" "$pkgdir/usr/bin/yamlfmt"
}
