pkgname=boost-note-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Boost Note.next, a replacement for Boostnote, an open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boost-note')

source_x86_64=("https://github.com/BoostIO/BoostNote.next/releases/download/v${pkgver}/boost-note-linux.deb")
sha512sums_x86_64=('7c0f9ad5e782a7d15dc3d30f026810d5509f487cf3c428a798dad50d5b4810965389b59bb26288ca6e81c168e90a96e909d3ea1b78cecb0941c6076d9e389d2f')

package(){

	# Extract package data
	tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}


