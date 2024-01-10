# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-810series'
pkgver='4.40'
_pkgver='4_40'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter E810 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/19626/'
license=('Custom')
source=("https://downloadmirror.intel.com/812368/E810_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('05ac6c72dfdc69e51db979e555558443bcdf0c4c78d577cb0725a3c6364d5733')

prepare() {
  rm -rf "E810/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "E810/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
