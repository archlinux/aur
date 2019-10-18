# Maintainer: Camilo Prieto <camilo.prieto93@gmail.com>
pkgname=boostnote-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
conflicts=('boostnote')

source_x86_64=("https://github.com/BoostIO/boost-releases/releases/download/v${pkgver}/boostnote_${pkgver}_amd64.deb")
sha512sums_x86_64=('b1ab15255f9439d539171a930cec34ea0053933dd5d47bf9927130da639cd820f1544bde877a8f0db071b670c40da34ba2dbec8e576f74d5ba89d920160a407d')

package(){

	# Extract package data
	tar -xf data.tar.xz -C "${pkgdir}" --no-same-permissions
}

