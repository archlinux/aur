# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-700series'
pkgver='9.56'
_pkgver='9_56'
_pkgid='871967'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter 700 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/18635'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/700Series_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('6af4b9da55121de57491a4314a9740ae0dae15fce01921bee2bc05702cc0b6a0')

prepare() {
  rm -rf "700Series/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "700Series/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
