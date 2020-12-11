# Maintainer: Tobi Fuhrimann

pkgname=pacmanfile
pkgver=0.0.1
pkgrel=3
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/pacmanfile"
license=(Apache)
provides=(pacmanfile)
source=('https://raw.githubusercontent.com/mastertinner/pacmanfile/main/pacmanfile')
sha256sums=('9fd9b54cbc0141a4e97f2717223fb527a69f84a21cf6ab868eda2a649c8d941a')

package() {
	install -Dm755 pacmanfile -t "${pkgdir}/usr/bin"
}
