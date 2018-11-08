# Maintainer: Bailey Kasin <bailey@gingertechnology.net>
pkgname=libdtrace-ctf
pkgver=0.8.1
pkgrel=1
pkgdesc="libdtrace-ctf is the Compact Type Format library used by DTrace on Linux"
arch=('x86_64')
url="https://github.com/oracle/libdtrace-ctf/"
license=('UPL')
makedepends=(
        'elfutils'
        'zlib'
)

source=("https://github.com/oracle/libdtrace-ctf/archive/0.8.1.tar.gz")
md5sums=('a1aa6849af3874a49be532bfd98f40bd')

build() {
        cd "$srcdir/$pkgname-$pkgver"

	make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"

	sudo make install
}
