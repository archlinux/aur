# Maintainer: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=vmware-auto-unlocker
pkgver=1.1
pkgrel=1
pkgdesc="Unlocker for VMWare macOS"
arch=('x86_64')
url="https://github.com/paolo-projects/auto-unlocker/"
license=('GPL3')
depends=('curl' 'libarchive')
source=("https://github.com/paolo-projects/auto-unlocker/releases/download/v${pkgver}/autounlocker_${pkgver}.0_amd64.deb")
sha512sums=('a42c12b63774f5b8317dd1ac350b1c1f3ae9f8b3b11e1238db41725a595a8ca29b54886dce8db98e8a4bd15798d0fec280fe44221b05430f7e733d2663c6a364')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
