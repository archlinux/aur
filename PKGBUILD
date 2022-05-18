# Maintainer: Dankcuddlybear dankcuddlybear@protonmail.com
pkgname=hackbgrt-bin
pkgver=1.5.1
pkgrel=1
pkgdesc='Boot logo changer for 64 bit UEFI systems (precompiled)'
arch=(x86_64)
url='https://github.com/Metabolix/HackBGRT'
license=('MIT')
depends=('efibootmgr')
install=hackbgrt.install
source=('https://github.com/Metabolix/HackBGRT/releases/download/v1.5.1/HackBGRT-1.5.1.zip' 'hackbgrt-install')
sha512sums=('d4a362058cac10e3fa31665ee72370e0f4854fea07d9386112f0525bf4643f9d14fae25adf824fe2ab3723be2dd574c67491cc38174a989fa233e0d75e24ca84' '39657aaf6a174a00ca05ef8a8c21f67c953e8f568c517033631ae8ee90d9e0ba5600a980b22a7d65e3956bbcacc821b48b9e0964e9708092d420622b7d2d5992')
package() {
	mkdir -p $pkgdir/usr/lib/hackbgrt $pkgdir/usr/bin
	mv $srcdir/HackBGRT-1.5.1/bootx64.efi $pkgdir/usr/lib/hackbgrt/bootx64.efi
	mv $srcdir/HackBGRT-1.5.1/config.txt $pkgdir/usr/lib/hackbgrt/config.txt
	mv $srcdir/HackBGRT-1.5.1/setup.exe $pkgdir/usr/lib/hackbgrt/setup.exe
	mv $srcdir/HackBGRT-1.5.1/splash.bmp $pkgdir/usr/lib/hackbgrt/splash.bmp
	mv $srcdir/hackbgrt-install $pkgdir/usr/bin/hackbgrt-install
}
