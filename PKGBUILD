# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-810series'
pkgver='5.01'
_pkgver='5_01'
_pkgid='923620'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter E810 Series'
arch=('x86_64')
options=('!debug')
url='https://www.intel.com/content/www/us/en/download/19626'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/E810_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('153da6a6de6b8a7c17c35ecb509412ad791b57cffb59806160367587b33c7c02')

prepare() {
  rm -rf "E810/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "E810/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
