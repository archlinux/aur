# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=remove-orphaned-kernels
pkgver=1.1.2
pkgrel=1
pkgdesc="pacman -Rs orphaned kernel and driver packages, excluding currently-running."
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}/"
license=('GPL')
depends=('python' 'sudo')
source=("${pkgname}")
sha256sums=('80e00f2abe3d43da602388bbc89989b6288c9b9f068419a05a2aa4d015cd06e0')

package() {
  install -m755 -d "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
