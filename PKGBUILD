pkgname=boost-note-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source_x86_64=("https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")


package(){

	# Extract package data
	tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}


