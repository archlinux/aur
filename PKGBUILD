# Maintainer: humanbeing27 <electronneutrino27@proton.me>
pkgname=plymouth-theme-arch-bgrt
pkgver=2.1
pkgrel=2
pkgdesc="Jimmac's spinner theme using the ACPI bgrt graphics as background and The Arch Logo."
arch=(any)
url='https://github.com/humanbeing27/plymouth-theme-arch-bgrt'
depends=('plymouth')
source=(${url}/archive/refs/heads/main.zip)
sha512sums=("a882e704979cdef41ecd3fb3da3a29b269c52b4857af7188f9463e8ad26252368294dec5983e55781ba123309722a78856e1c9202194bae06fbc3ec2da2e79ca")
package(){
	install -Dm755 -o root -g root ${srcdir}/plymouth-theme-arch-bgrt-main/plymouth-theme-arch-bgrt/* $pkgdir/usr/share/plymouth/themes/arch-bgrt
}
