# Maintainer: Camilo Prieto <camilo.prieto93@gmail.com>
pkgname=boostnote-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boostnote')

source_x86_64=("https://github.com/BoostIO/boost-releases/releases/download/v${pkgver}/boostnote_${pkgver}_amd64.deb")
sha512sums_x86_64=('3e6f37b24cb8d47922b2de8a8b83a2bf22de264139bd81bdb773a0b83bf8fe477f63b5a74746f5fb4fa63bb57ceed62b7dd6ba2f0669486998f1896090eb527c')

package(){

	# Extract package data
	tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}

