# Maintainer: Mikusiowy2 <you@example.com>

pkgname=efi-filesystem
pkgver=1.0
pkgrel=1
pkgdesc="Creates base EFI filesystem structure under /boot/efi"
arch=('any')
license=('GPL')
depends=()
provides=('efi-filesystem')
conflicts=()
backup=()
install=
source=()
md5sums=()

package() {
  # Create EFI directories
  install -d "$pkgdir/boot/efi"
  install -d "$pkgdir/boot/efi/EFI"
  install -d "$pkgdir/boot/efi/EFI/BOOT"
  install -d "$pkgdir/boot/efi/EFI/arch"
  chown 0:0 "$pkgdir/boot" "$pkgdir/boot/efi" "$pkgdir/boot/efi/EFI" "$pkgdir/boot/efi/EFI/BOOT" "$pkgdir/boot/efi/EFI/arch"
  chmod 700 "$pkgdir/boot" "$pkgdir/boot/efi" "$pkgdir/boot/efi/EFI" "$pkgdir/boot/efi/EFI/BOOT" "$pkgdir/boot/efi/EFI/arch"
}
