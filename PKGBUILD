# Maintainer: humanbeing27 <electronneutrino27@proton.me>
pkgname=plymouth-theme-arch-bgrt
pkgver=2.1
pkgrel=4
pkgdesc="Jimmac's spinner theme using the ACPI bgrt graphics as background and The Arch Logo."
arch=(any)
url='https://aur.archlinux.org/packages/plymouth-theme-arch-bgrt'
depends=('plymouth')
source=(https://www.dropbox.com/s/k3lhk6bvc4xs077/arch-bgrt.tar.gz)
b2sums=('b7675105830b89c7a8c862b9d846702ec77a557d1f0d168ff54331f6e57fb21c2f1c680aa7d22db5a839552828244696577b34b7fbb6f1bdf6b05db04e6e04e3')
package(){
	rm $srcdir/arch-bgrt.tar.gz
	mkdir -p $pkgdir/usr/share/plymouth/themes/arch-bgrt/
	install -Dm 755 $srcdir/* $pkgdir/usr/share/plymouth/themes/arch-bgrt/
}
