# Maintainer: Dankcuddlybear dankcuddlybear@protonmail.com
pkgname=hackbgrt-bin
pkgver=1.5.1
pkgrel=2
pkgdesc='UEFI boot logo changer. Precompiled for 64 bit and 32 bit x86 UEFI.'
arch=(any)
url='https://github.com/Metabolix/HackBGRT'
license=('MIT')
depends=('efibootmgr')
install=hackbgrt.install
source=('https://github.com/Metabolix/HackBGRT/releases/download/v1.5.1/HackBGRT-1.5.1.zip' 'hackbgrt-install')
sha512sums=('d4a362058cac10e3fa31665ee72370e0f4854fea07d9386112f0525bf4643f9d14fae25adf824fe2ab3723be2dd574c67491cc38174a989fa233e0d75e24ca84' 'bd73df81e5632d7c63d054f6810fe8a2b0797987078b570c0d19840c85ab03cdcb28ef1a9bed2ccca19c7f7209b51149327c848e6d690a13afbba086b401beb0')
package() {
	mkdir -p $pkgdir/usr/lib/hackbgrt $pkgdir/usr/bin
	mv $srcdir/HackBGRT-1.5.1/bootia32.efi $pkgdir/usr/lib/hackbgrt/bootia32.efi
	mv $srcdir/HackBGRT-1.5.1/bootx64.efi $pkgdir/usr/lib/hackbgrt/bootx64.efi
	mv $srcdir/HackBGRT-1.5.1/config.txt $pkgdir/usr/lib/hackbgrt/config.txt
	mv $srcdir/HackBGRT-1.5.1/setup.exe $pkgdir/usr/lib/hackbgrt/setup.exe
	mv $srcdir/HackBGRT-1.5.1/splash.bmp $pkgdir/usr/lib/hackbgrt/splash.bmp
	mv $srcdir/hackbgrt-install $pkgdir/usr/bin/hackbgrt-install
}
