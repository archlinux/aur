pkgname=no
pkgver=1.0
pkgrel=1
pkgdesc="Well yes, but actually no."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://git.calitabby.net/vel/no"
options=(!lto)
license=('Velicense')
depends=()
optdepends=()
makedepends=('zig')
source=("https://git.calitabby.net/vel/no/raw/branch/master/no.zig")
sha256sums=('517b7aecf6f4246ac1c5128a3aa12d6ad310cf068883a96f28222a71ee3186fa')

build() {
	zig build-exe no.zig
}

package() {
	install -Dm755 no "$pkgdir/usr/bin/no"
}
