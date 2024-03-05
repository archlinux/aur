# Maintainer: 1ridic <i@8f.al>
pkgname=mkinitcpio-dsdt-hook
pkgver=0.1
pkgrel=1
pkgdesc="This hook adds acpi_override files to the initramfs for those who have modified the dsdt table following https://wiki.archlinux.org/title/DSDT."
arch=("any")
license=("GPL")
depends=('mkinitcpio' 'libarchive')
source=("dsdt")
sha256sums=('89790ef4a84220c8c2d6bb2fef5fdd1afbf588a324b1135c6e7c17fe19886c0d')

package() {
	install -Dm644 "$srcdir/dsdt" "$pkgdir/usr/lib/initcpio/install/dsdt"
}

