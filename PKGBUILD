# Maintainer: Camilo Prieto <camilo.prieto93@gmail.com>
pkgname=boostnote-bin
pkgver=0.11.7
pkgrel=1
pkgdesc="Open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron' 'nodejs')
conflicts=('boostnote')

source_x86_64=("https://github.com/BoostIO/boost-releases/releases/download/v${pkgver}/boostnote_${pkgver}_amd64.deb")
sha512sums_x86_64=('3b61890f660ab9be0ed543b9c3187ad7bb0786a626a08dbaebf767db5f6c20ee3949a07876cbf4f0aca23e8c254c9b900d3d83da0cec4425345c431372cce3d8')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}

