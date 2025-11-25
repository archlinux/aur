# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=lima

pkgname=lima-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
license=('MIT')
source=("https://github.com/lima-vm/${_pkggit}/releases/download/v${pkgver}/${_pkggit}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('0e90b5c55aaf92f1b4af572763578f37da024ee9b77fcd232b8bc8d47750c7f4')

package() {
  cp -r "${srcdir}" "${pkgdir}"/usr
  find $pkgdir -iname ${pkgname}-${pkgver}* | xargs -r rm -rf
}
