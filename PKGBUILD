# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-700series'
pkgver='9.40'
_pkgver='9_40'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter 700 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/18635/'
license=('Custom')
source=("https://downloadmirror.intel.com/812374/700Series_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('695a3e1b20531f0d4ba185dfc20dcef3d1943cc4775f12da47460e1145bad74e')

prepare() {
  rm -rf "700Series/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "700Series/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
