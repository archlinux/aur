# Maintainer: Camilo Prieto <camilo.prieto93@gmail.com>
pkgname=boostnote-bin
pkgver=0.15.2
pkgrel=1
pkgdesc="Open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boostnote')

source_x86_64=("https://github.com/BoostIO/boost-releases/releases/download/v${pkgver}/boostnote_${pkgver}_amd64.deb")
sha512sums_x86_64=('49eb531d566c4e8bd54c419cf3be6cccd557e70d2fb4f51260052550ba4c5be2c5acd5b3313ca78afc3453e91ca548521967eb995d28d3e5a3f37a1fc5c36f3e')

package(){

	# Extract package data
	tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}

