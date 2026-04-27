# Maintainer: Stezkoy

pkgname=vkplay-gamecenter-bin
pkgdesc='VK Play - online gaming service for game lovers, developers and content creators. The platform combines streaming, esports, a place for communication with like-minded users, a catalog of games and cloud gaming.'
pkgver=1.15
pkgrel=4
arch=('x86_64')
url="vkplay.ru"
license=('ISC')
options=('!strip' '!debug' )
provides=('vkplay'  'GameCenterShowcase')
install=${pkgname}.install
depends=( 'gtk3' )
source=("${pkgname}-${pkgver}.deb::https://static.gc.${url}/gclinux/deb_repo/GameCenterShowcase_amd64.deb")
sha512sums=('2768d06f804725129acc444f6d3bc434bbe3f18fbaf65569256fab8fac00f5b4d0e3f78b07d7a88b2045a5d9a9aa1b9559814517608ea11bfee52ecdd2ed39d9')

package(){
	bsdtar xf data.tar.zst -C "${pkgdir}"
}
