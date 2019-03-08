# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Steve Skydev <steve@skycoin.net>
pkgname=skycoin_archlinux_packages-mirrorlist
pkgdesc="skycoin archlinux packages mirrorlist"
pkgver=1
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/0pcom/skycoin_archlinux_packages"
license=()
makedepends=()
source=('https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/master/skycoin_archlinux_packages-mirrorlist/skycoin_archlinux_packages-mirrorlist')
sha256sums=('7fec8fe4345a75775ff538a1b5a34940c8ff327d3a746f89e9d59a67bceeec03')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')

package() {
msg2 'installing files'
mkdir -p $pkgdir/etc/pacman.d/
install -Dm755 $srcdir/$pkgname $pkgdir/etc/pacman.d/$pkgname
}
