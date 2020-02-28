# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=remove-orphaned-kernels
pkgver=1.0
pkgrel=1
pkgdesc="pacman -Rs orphaned kernel and driver packages, excluding currently-running."
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}/"
license=('GPL')
depends=('python' 'sudo')
source=("${pkgname}")
sha256sums=('a6939f973aa8013944354db38d4b42e0bcf69673fbabbc804af9842d27101649')

package() {
  install -m755 -d "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}