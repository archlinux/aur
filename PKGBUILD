# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-810series'
pkgver='4.90'
_pkgver='4_90'
_pkgid='863992'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter E810 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/19626'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/E810_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('09eb459a160d3403137ed542dcc781988ba2000ed9155976819a027a100c188c')

prepare() {
  rm -rf "E810/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "E810/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
