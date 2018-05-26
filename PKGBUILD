# Maintainer: Camilo Prieto <camilo.prieto93@gmail.com>
pkgname=boostnote-bin
pkgver=0.11.5
pkgrel=1
pkgdesc="Open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron' 'nodejs')
conflicts=('boostnote')

source_x86_64=("https://github.com/BoostIO/boost-releases/releases/download/v${pkgver}/boostnote_${pkgver}_amd64.deb")
sha512sums_x86_64=('36db9cbab1412246e7b1d8db048990ee49284bf2d7f1e25afbac34cd20588b1f3addc503954bbd0fc7d5bcd76851d07d1104d1dfb4deded517bc775ec4579c4f')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}

