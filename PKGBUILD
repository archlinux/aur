# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: sunflsk (https://aur.archlinux.org/account/sunflsks)

pkgname=kernel-chktaint
_version=6
pkgver="${_version}.17.7"
pkgrel=1
url="http://kernel.org/"
pkgdesc="Check kernel for tainted modules"
arch=("any")
license=('GPL-2.0-only')
depends=(
  "sh"
)
source=("https://cdn.kernel.org/pub/linux/kernel/v$_version.x/linux-"$pkgver".tar.xz")
sha256sums=("ddf2ea0d4439e1d57136be3623102af9458f601f5b1cb77e83246e88aea09d0e")

package() {
  install -Dvm755 -t "${pkgdir}/usr/bin"  "${srcdir}/linux-${pkgver}/tools/debugging/kernel-chktaint"
}
