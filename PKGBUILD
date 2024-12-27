# Maintainer: Leah Anderson <leah.anderson4435@proton.me>
pkgname=cgpt-bin
pkgver=15054.B
pkgrel=1
_rel=R106
pkgdesc="GPT manipulation tool with support for Chromium OS extensions"
arch=('x86_64')
url="https://chromium.googlesource.com/chromiumos/platform/vboot_reference/"
license=('BSD')
depends=('glibc' 'libuuid.so')
provides=('cgpt')
source=("cgpt::https://files.tree123.org/utils/x86_64/gnu/cgpt")
sha512sums=("2ba43dd521971517c0eabca2b82dfa812f336fd9b34f5725b1eab6be9b49d8f07eb9148bec698f42bc35b852212240e1d82353a8aa329cbbf322637ef4123a83")

package() {
	cd "$srcdir"
	chmod 755 cgpt
	mkdir -p "$pkgdir"/usr/bin
	cp cgpt "$pkgdir"/usr/bin
}
