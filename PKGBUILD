# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=remove-orphaned-kernels
pkgver=1.1.1
pkgrel=1
pkgdesc="pacman -Rs orphaned kernel and driver packages, excluding currently-running."
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}/"
license=('GPL')
depends=('python' 'sudo')
source=("${pkgname}")
sha256sums=('d041487cf36a813ca2cf8abe023bdc6ec13921574580c3fbbbc4eb73f4c0f0fb')

package() {
  install -m755 -d "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
