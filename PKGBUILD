# Maintainer: KiWi42 <pullthisplug dash aur at yahoo dot com>

pkgname=netexec
pkgver=1.2.0
pkgrel=1
pkgdesc='A swiss army knife for pentesting Windows/Active Directory environments'
arch=('x86_64')
url='https://github.com/Pennyw0rth/NetExec'
license=('BSD-2-Clause')
replaces=('crackmapexec')
source=("${url}/releases/download/v${pkgver}/nxc")
sha256sums=('9c4220e526290ffc836ccef6ad7556e760c50fcdf3e3c56d912754ffad64190b')

package() {
  install -Dm755 nxc "$pkgdir/usr/bin/nxc"
}
