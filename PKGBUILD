# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-700series'
pkgver='9.53'
_pkgver='9_53'
_pkgid='843916'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter 700 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/18635'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/700Series_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('b03583a8b7d768b27212b9166962d2facee5b279584bec732c288a0f1390b48c')

prepare() {
  rm -rf "700Series/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "700Series/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
