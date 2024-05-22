# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-810series'
pkgver='4.50'
_pkgver='4_50'
_pkgid='822496'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter E810 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/19626'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/E810_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('26463b80f35e14a1b53eff30511c3b3cd0c7047607c6817cf6e45e15a9a2134c')

prepare() {
  rm -rf "E810/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "E810/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
