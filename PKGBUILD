# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=lima
pkgver=0.11.0
pkgrel=1
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
license=('MIT')
source=("https://github.com/lima-vm/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('423795c03fd7dfe63530b9f1767269c7cee1a761954fa5b5ee845462051b4b5f')

package() {
  cp -r "${srcdir}" "${pkgdir}"/usr
  find $pkgdir -iname ${pkgname}-${pkgver}* | xargs -r rm -rf
}
