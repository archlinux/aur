# Maintainer: KiWi42 <pullthisplug dash aur at yahoo dot com>

pkgname=netexec
pkgver=1.1.0
pkgrel=1
pkgdesc='A swiss army knife for pentesting Windows/Active Directory environments'
arch=('any')
url='https://github.com/Pennyw0rth/NetExec'
license=('BSD-2-Clause')
depends=('python')
replaces=('crackmapexec')
source=("${url}/releases/download/v${pkgver}/nxc")
sha256sums=('a78f78fa018f18e2f95f4b535ab7fe78c5387242ecca1fcff674ca87140ad367')

package() {
  install -Dm755 nxc "$pkgdir/usr/bin/nxc"
}
