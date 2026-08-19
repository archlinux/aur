# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-700series'
pkgver='9.57'
_pkgver='9_57'
_pkgid='920685'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter 700 Series'
arch=('x86_64')
options=('!debug')
url='https://www.intel.com/content/www/us/en/download/18635'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/700Series_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('1f0abaf0318cf0bd143ee034eea60df4798ca19588d7cbbc14ac4fbe3283b696')

prepare() {
  rm -rf "700Series/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "700Series/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
