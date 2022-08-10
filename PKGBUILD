# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=lima

pkgname=lima-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
license=('MIT')
source=("https://github.com/lima-vm/${_pkggit}/releases/download/v${pkgver}/${_pkggit}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('00a70555cd63906510bea5d7c2b4f140256ff06a6eae98ff2793d1d5822fe02f')

package() {
  cp -r "${srcdir}" "${pkgdir}"/usr
  find $pkgdir -iname ${pkgname}-${pkgver}* | xargs -r rm -rf
}
