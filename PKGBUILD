# Maintainer: Tobi Fuhrimann

pkgname=pacfile-bin
pkgver=0.0.1
pkgrel=3
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/pacfile"
license=(Apache)
provides=(pacfile)
source=('https://raw.githubusercontent.com/mastertinner/pacfile/main/pacfile')
sha256sums=('9fd9b54cbc0141a4e97f2717223fb527a69f84a21cf6ab868eda2a649c8d941a')

package() {
	install -Dm755 pacfile -t "${pkgdir}/usr/bin"
}
