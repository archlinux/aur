# Maintainer: Camilo Prieto <camilo.prieto93@gmail.com>
pkgname=boostnote-bin
pkgver=0.11.6
pkgrel=1
pkgdesc="Open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron' 'nodejs')
conflicts=('boostnote')

source_x86_64=("https://github.com/BoostIO/boost-releases/releases/download/v${pkgver}/boostnote_${pkgver}_amd64.deb")
sha512sums_x86_64=('d17fa3cf574f0bd078482ed132805ff58a1ce858444c7304dc98e10bbee1fc6b51b6eb6e79e22e8bcbddd66e12db6cfdc885711c1064d990146e99bcd04f449a')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}

