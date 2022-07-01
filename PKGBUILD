# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima
pkgver=0.11.1
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
license=('MIT')
source=("https://github.com/lima-vm/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('6c021b4ff579d5df33eff8d03a97073e3baf36e90c03d2a772ae3f11c7d78432')

package() {
  cp -r "${srcdir}" "${pkgdir}"/usr
  find $pkgdir -iname ${pkgname}-${pkgver}* | xargs -r rm -rf
}
