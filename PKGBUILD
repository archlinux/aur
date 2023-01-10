# Maintainer: humanbeing27 <electronneutrino27@proton.me>
pkgname=plymouth-theme-arch-bgrt
pkgver=2.1
pkgrel=2
pkgdesc="Jimmac's spinner theme using the ACPI bgrt graphics as background and The Arch Logo."
arch=(any)
url='https://github.com/humanbeing27/plymouth-theme-arch-bgrt'
depends=('plymouth')
source=(${url}/archive/refs/heads/main.zip)
sha512sums=("54b21cd42d6cae8cb0bae06056c2c4b102f73d8d6458b42f387e073cf0962e11b609768ad9da87519869cb645fe89429e09da509135e414c24d625f37774ff3d")
package(){
	install -Dm755 -o root -g root ${srcdir}/plymouth-theme-arch-bgrt-main/plymouth-theme-arch-bgrt/* $pkgdir/usr/share/plymouth/themes/arch-bgrt
}
