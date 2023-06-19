# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=lima

pkgname=lima-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
license=('MIT')
source=("https://github.com/lima-vm/${_pkggit}/releases/download/v${pkgver}/${_pkggit}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('be6093c2a9b0aa3c39cc5a5e39e79223c6d03f0e07ebadf70c3c128143672a84')

package() {
  cp -r "${srcdir}" "${pkgdir}"/usr
  find $pkgdir -iname ${pkgname}-${pkgver}* | xargs -r rm -rf
}
