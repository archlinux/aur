# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=lima

pkgname=lima-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
license=('MIT')
source=("https://github.com/lima-vm/${_pkggit}/releases/download/v${pkgver}/${_pkggit}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('efd100c65173d0dff885e61778fa61737a609fc543d8260b491c8090c000bd3b')

package() {
  cp -r "${srcdir}" "${pkgdir}"/usr
  find $pkgdir -iname ${pkgname}-${pkgver}* | xargs -r rm -rf
}
