# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-700series'
pkgver='9.52'
_pkgver='9_52'
_pkgid='832166'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter 700 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/18635'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/700Series_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('2468d7747b0f0388b696f493556a4e9983b109f35c6d6c754c98ad8886ba351d')

prepare() {
  rm -rf "700Series/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "700Series/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
