# Contributor: keutain (https://aur.archlinux.org/account/keutain)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: sunflsk (https://aur.archlinux.org/account/sunflsks)

pkgname=kernel-chktaint
major_kernel_release=6
pkgver="${major_kernel_release}.17.9"
pkgrel=1
url="http://kernel.org/"
pkgdesc="Check kernel for tainted modules"
arch=("any")
license=('GPL-2.0-only')
depends=(
  "sh"
)
source=("https://cdn.kernel.org/pub/linux/kernel/v$major_kernel_release.x/linux-"$pkgver".tar.xz")
sha256sums=('6d08803b953c509df48d44d3281ed392524321d8bb353eb21c0555790c8f8e06')

package() {
  install -Dvm755 -t "${pkgdir}/usr/bin" "${srcdir}/linux-${pkgver}/tools/debugging/kernel-chktaint"
}
