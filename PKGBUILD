# Maintainer: Camilo Prieto <camilo.prieto93@gmail.com>
pkgname=boostnote-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boostnote')

source_x86_64=("https://github.com/BoostIO/boost-releases/releases/download/v${pkgver}/boostnote_${pkgver}_amd64.deb")
sha512sums_x86_64=('a6a2cc3489491e9edf88c3764b0821a37362bb932eb387580ce8cf20522072ac791a09336763c1f5ef28926e568dd21539006d96ddc7c4e0beae91c987ba6ea7')

package(){

	# Extract package data
	tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}

