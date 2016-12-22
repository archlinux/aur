# Maintainer: Michael Egger <michael.egger@tsn.at>

pkgname=linux-libre-bin
pkgver=4.8.14
pkgrel=1
pkgdesc="A libre version of Debian Icedove, the standalone mail and news reader based on Mozilla Thunderbird."
arch=('i686' 'x86_64')
url="https://wiki.parabola.nu/$pkgname"
license=('BSD')
provides=('linux-libre')
  depends=('coreutils' 'linux-libre-firmware' 'kmod' 'mkinitcpio')
  optdepends=('crda: to set the correct wireless channels of your country')

source_i686=(https://repomirror.parabola.nu/pool/parabola_gnu+linux/linux-libre-$pkgver_gnu-1-i686.pkg.tar.xz)
source_x86_64=(https://repomirror.parabola.nu/pool/parabola_gnu+linux/linux-libre-$pkgver_gnu-1-x86_64.pkg.tar.xz)

sha256sums_i686=('0c90cea68b0d950da6759d29559152089372b4f06de939e890ad3c4db682d66a')
sha256sums_x86_64=('29ef44e5153e7d611250aa2ce2fd37c81fcd07a45424b13de9f0a65f499e53a6')

package() {
  tar xJvf ${srcdir}/linux-libre-$pkgver_gnu-1-$arch.pkg.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:


