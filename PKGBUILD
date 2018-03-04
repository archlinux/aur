# Maintainer: Duncan X Simpson <virtualdxs@gmail.com>
# Contributor: Duncan X Simpson <virtualdxs@gmail.com>
pkgname=pat-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A modern Winlink client"
arch=('i686' 'x86_64' 'armhf')
url="http://getpat.io"
license=('MIT')
groups=('')
optdepends=('gpsd>=2.90'
            'hamlib>=1.2'
            'ncurses')
options=('!strip' '!emptydirs')
source_i686=("https://github.com/la5nta/pat/releases/download/v0.6.0/pat_0.6.0_linux_i386.deb")
source_x86_64=("https://github.com/la5nta/pat/releases/download/v0.6.0/pat_0.6.0_linux_amd64.deb")
sha512sums_i686=('7fc2f5a5a91b5df2301e499369118093296d6dbe520dc6d98d20077d9f75cbea97f996aee68585f8b0477246ffb848f9c7ce22118e2c423dab4db9b1ae9ef51f')
sha512sums_x86_64=('b706a95be9336a5f0e9e23e15ed71ce6117bb0729c2974087ddcf33f69c6461cc8f5a637a2172df86b916f6afa0567e20171e3e7fb3ed18e80c58015f5adb0a6')
sha512sums_armhf=('acd8c1a4923d50c9c3b2d2168b578bd23bdf012ceefbc64ffb1ea2481b24eb97f92f26517dcb93a4ffb79c4999eee4c433f718b591cd29449d685eeea52a2b2a')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..

}
