# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-810series'
pkgver='4.80'
_pkgver='4_80'
_pkgid='853749'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter E810 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/19626'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/E810_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('fcbc1294c6bc6b54b603b55e4f4d6e24d7b032fa69ccaec60f9f9f88291eeb7b')

prepare() {
  rm -rf "E810/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "E810/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
