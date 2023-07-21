# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-700series'
pkgver='9.20'
_pkgver='9_20'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter 700 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/715595/'
license=('Custom')
source=("https://downloadmirror.intel.com/769287/700Series_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('0ee0c01aa7feaf5d7ec16c49c9f55278b419fa6a21bc7b459f6e1a319ece8b2b')

prepare() {
  rm -rf "700Series/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "700Series/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
