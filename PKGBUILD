# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=lima

pkgname=lima-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
license=('MIT')
source=("https://github.com/lima-vm/${_pkggit}/releases/download/v${pkgver}/${_pkggit}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('7d18b1716aae14bf98d6ea93a703e8877b0c3142f7ba2e87401d47d5d0fe3ff1')

package() {
  cp -r "${srcdir}" "${pkgdir}"/usr
  find $pkgdir -iname ${pkgname}-${pkgver}* | xargs -r rm -rf
}
