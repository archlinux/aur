# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='intel-ethernet-810series'
pkgver='4.70'
_pkgver='4_70'
_pkgid='843910'
pkgrel='1'
pkgdesc='NVM Update Utility for Intel® Ethernet Network Adapter E810 Series'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/download/19626'
license=('Custom')
source=("https://downloadmirror.intel.com/${_pkgid}/E810_NVMUpdatePackage_v${_pkgver}_Linux.tar.gz")
sha256sums=('d5f4f4d79075c08d2a50453264a6b2145d7bd4358789ded0404f723fcbb520ab')

prepare() {
  rm -rf "E810/Linux_x64/"*pdf
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "E810/Linux_x64" "${pkgdir}/opt/${pkgname}"
}
