# Maintainer: Camilo Prieto <camilo.prieto93@gmail.com>
pkgname=boostnote-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="Open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boostnote')

source_x86_64=("https://github.com/BoostIO/boost-releases/releases/download/v${pkgver}/boostnote_${pkgver}_amd64.deb")
sha512sums_x86_64=('3229c8ab2a696e24a3a59956aa4d6069c24152b3b5bd891fabd743b009069a8f2b6698f6ca09ccdcf884b7b46eccc64ff4df213e369e0c1ffae902857a7877c7')

package(){

	# Extract package data
	tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}

