# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-700series'
pkgver='9.55'
_pkgver='9_55'
_pkgid='864008'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter 700 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/18635'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/700Series_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('9ed3b039cad9857b498264deb7198eda030d534258ef2dca01bcc9824b350ef9')

prepare() {
  rm -rf "700Series/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "700Series/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
