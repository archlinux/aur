# Maintainer: Stezkoy

pkgname=vkplay-gamecenter-bin
pkgver=1.15
pkgrel=1
arch=('x86_64')
url="vkplay.ru"
license=('ISC')
options=('!strip' )
provides=('vkplay'  'GameCenterShowcase')
install=${pkgname}.install
depends=('atk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcups' 'libgcc' 'libstdc++' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxkbcommon' 'libxrandr' 'nss')
source=("${pkgname}-${pkgver}.deb::https://static.gc.${url}/gclinux/deb_repo/GameCenterShowcase_amd64.deb")
sha512sums=('2768d06f804725129acc444f6d3bc434bbe3f18fbaf65569256fab8fac00f5b4d0e3f78b07d7a88b2045a5d9a9aa1b9559814517608ea11bfee52ecdd2ed39d9')

package(){
	bsdtar xf data.tar.zst -C "${pkgdir}"
}
