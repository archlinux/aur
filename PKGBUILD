# Maintainer: nardholio <nardholio@gmail.com>

pkgname=mount-windows
pkgver=3
pkgrel=1
pkgdesc="Helper script to automagically detect and mount the Windows C: partition in Linux dual-boot systems. Supports BitLocker and WSL. Reliably exposes a symlink at /run/windows for use in other scripts."
arch=('any')
url="https://wiki.archlinux.org/title/Dual_boot_with_Windows"
license=('0BSD')
depends=('chntpw' 'ntfs-3g' 'util-linux' 'udisks2' 'cryptsetup' 'polkit')
install="${pkgname}.install"
source=("${pkgname}.sh")
sha256sums=('9fb3c10e3c5230c3fc723a5d32b498fa94e694ea093d46e522132d6c12e5c7fd')
options=(!strip !debug)

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
