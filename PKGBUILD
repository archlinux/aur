pkgname=boost-note-bin
pkgver=0.4.1
pkgrel=2
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source_x86_64=("https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums_x86_64=('71dd596dfb0cefd0ce869c609262802fca3d9636cbe8b32b1efb032cb77e62d13ad58739870c3c9f4ab496ba6a97b754b90637c4e69372ea3245bbc5e3b0bf94')

package(){

	# Extract package data
	tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}



