# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-x550'
pkgver='3.70'
_pkgver='3_70'
_pkgid='843924'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter X550'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/19360'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/X550_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('4e8413e005bd3fc23bd833b09d2b7e4a44341bc27d17bb1372fa7cafee83e5a3')

prepare() {
  rm -rf "X550/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "X550/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
