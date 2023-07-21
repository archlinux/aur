# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-810series'
pkgver='4.20'
_pkgver='4_20'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter E810 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/19624/'
license=('Custom')
source=("https://downloadmirror.intel.com/769278/E810_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('c8695c9c0d82c7206270b3d6f16f70ab50dc5176ac5b885d5603d11abc662f80')

prepare() {
  rm -rf "E810/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "E810/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
