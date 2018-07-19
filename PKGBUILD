# Maintainer: K900 <me@0upti.me>
_pkgname=windows2usb
pkgname=${_pkgname}-git
pkgver=0.1.5
pkgrel=1

pkgdesc="Windows 7/8/8.1/10 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS)"
arch=("any")
url="https://github.com/ValdikSS/windows2usb"
license=("Apache")

depends=("bash" "util-linux" "p7zip" "ms-sys")

source=("git+https://github.com/ValdikSS/windows2usb.git")
md5sums=("SKIP")

package() {
	cd $_pkgname
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
