# Maintainer: nardholio <nardholio@gmail.com>

pkgname=mount-windows
pkgver=2
pkgrel=1
pkgdesc="Helper script to automagically detect and mount the Windows C: partition in Linux dual-boot systems. Supports BitLocker and WSL. Reliably exposes a symlink at /run/windows for use in other scripts."
arch=('any')
url="https://wiki.archlinux.org/title/Dual_boot_with_Windows"
license=('0BSD')
depends=('chntpw' 'ntfs-3g' 'util-linux' 'udisks2' 'cryptsetup' 'polkit')
install="${pkgname}.install"
source=("${pkgname}.sh")
sha256sums=('a7d283c7764630b8657cef2c6b46ddfd67807d7c1cb1b3574debf537596240bf')
options=(!strip !debug)

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
