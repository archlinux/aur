# Maintainer: Ricardo Madriz <richin13 at gmail dot com>
# Contributor: ThePilot <afuturepilotis at gmail dot com>
# Contributor: Padfoot <padfoot at exemail dot com dot au>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
pkgname='ambiance-radiance-colors-suite'
pkgver='16.04.1'
pkgrel=2
pkgdesc="Ambiance & Radiance Colors Suite for Unity, Gnome Classic, MATE, XFCE, LXDE and Openbox desktops"
arch=('any')
license=('GPL2')
options=('!strip' '!zipman')
url="http://www.ravefinity.com/p/ambiance-radiance-colors-suite.html"
depends=('gtk-engine-murrine')
optdepends=('rave-x-colors' 'gtk3>=3.14' 'gtk3<3.20')
source=("$pkgname-$pkgver.tar.gz::https://launchpad.net/~ravefinity-project/+archive/ubuntu/ppa/+files/ambiance-colors_$pkgver~xenial~NoobsLab.com_all.deb")
md5sums=('8938901b5f71e4e711870099e3b2dbaa')

package() {
	cd "${srcdir}"

	bsdtar -xf data.tar.xz -C "${pkgdir}"
}
