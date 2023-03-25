# Maintainer: restitux <restitux at ohea dot xyz>

pkgname=edk2-ovmf-fedora-bin
pkgver=20220826gitba0e0e4c6a17_1.fc37
pkgrel=1
pkgdesc="edk2-ovmf from fedora. includes VARS file preconfigured for secureboot"
arch=('any')
url='https://aur.archlinux.org/packages/edk2-ovmf-secure-vars'
license=('BSD')
source=('https://download.fedoraproject.org/pub/fedora/linux/releases/37/Everything/x86_64/os/Packages/e/edk2-ovmf-20220826gitba0e0e4c6a17-1.fc37.noarch.rpm')
sha256sums=('3cf55dd9550fcd96b50af469fea0e33c8b913e2c04d159439bd8c260259fa966')


package() {
	mkdir -p "$pkgdir/usr/share/licenses"
	cp -r usr/share/licenses/edk2-ovmf "$pkgdir/usr/share/licenses/$pkgname/"

	mkdir -p "$pkgdir/usr/share/doc"
	cp -r usr/share/doc/edk2-ovmf "$pkgdir/usr/share/doc/$pkgname/"

	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -r usr/share/qemu "$pkgdir/usr/share/$pkgname/"
	cp -r usr/share/edk2 "$pkgdir/usr/share/$pkgname/"
}
