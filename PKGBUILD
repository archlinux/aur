# Maintainer: nardholio <nardholio@gmail.com>

pkgname=mount-windows
pkgver=1.0
pkgrel=1
pkgdesc="Helper script to automagically determine the Windows system partition from UEFI in a dual-boot setup and mount it. Assumes GPT style partition scheme, NTFS formatting, and no Bitlocker"
arch=('any')
url="https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/bcd-system-store-settings-for-uefi"
license=('0BSD')
depends=('chntpw' 'ntfs-3g' 'util-linux' 'udisks2')
source=("${pkgname}.sh")
sha256sums=('f716582f66aadbacc39dc569b41c2a9ec056368a6e70f887e3e617dc7f325409')
options=(!strip !debug)

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
