# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=thunderbird-appmenu-bin
pkgver=60.7.2
_build=build2-0ubuntu0.19.04.1
pkgrel=2
pkgdesc="Thunderbird with appmenu patch from Ubuntu"
arch=('x86_64')
url="https://packages.ubuntu.com/source/disco/thunderbird"
license=('MPL' 'GPL' 'LGPL')
depends=('atk>=1.12.4' 'cairo>=1.10.0' 'dbus>=1.9.14' 'dbus-glib>=0.78' 'desktop-file-utils' 'fontconfig>=2.12.6' 'freetype2>=2.2.1' 'gcc8-libs>=6' 'gdk-pixbuf2>=2.22.0' 'glib2>=2.31.8' 'gtk3>=3.4' 'hicolor-icon-theme' 'libx11' 'libxcb' 'libxcomposite>=0.3' 'libxdamage>=1.1' 'libxext' 'libxfixes' 'libxrender' 'libxt' 'startup-notification>=0.8')
optdepends=('hunspell'
            'libcanberra'
            'libdbusmenu-glib'
            'libdbusmenu-gtk3'
            'lyx')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird')
replaces=('thunderbird')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(http://security.ubuntu.com/ubuntu/pool/main/t/thunderbird/thunderbird_${pkgver}+${_build}_amd64.deb)
sha512sums=('c466699c3cbce93b1b15494d91ea9496bb0418681c7959e2fd6b06e55fefb8b8416ea2f95dcf0b1da9a2c2cac464ac0aedb9c484a970bb48b34c3c9a69b93c3a')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
