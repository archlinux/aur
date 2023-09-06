# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

pkgname=yamlfmt
pkgver=0.10.0
pkgrel=1
pkgdesc='An extensible command line tool or library to format yaml files.'
arch=('x86_64')
url='https://github.com/google/yamlfmt'
license=(Apache 2.0)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/yamlfmt/releases/download/v0.10.0/yamlfmt_0.10.0_Linux_arm64.tar.gz")
md5sums=('2a6c18d0ce64c154b707a0936cff9fc5')

package() {
	install -Dm755 "$srcdir/yamlfmt" "$pkgdir/usr/bin/yamlfmt"
}
