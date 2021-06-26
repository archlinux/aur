# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=remove-orphaned-kernels
pkgver=1.1
pkgrel=1
pkgdesc="pacman -Rs orphaned kernel and driver packages, excluding currently-running."
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}/"
license=('GPL')
depends=('python' 'sudo')
source=("${pkgname}")
sha256sums=('53e18eb9ba1def9400210467380175ce019af3f7ca35fbd085b27e17fe5cbf8d')

package() {
  install -m755 -d "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
