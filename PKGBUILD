# Maintainer: Jeremy Pope <jpope@jpope.org> PGP-Key: E00B4261
# PKGBUILD mostly stolen from original ttf-openlogos package... :P
# and based from forum entry - https://bbs.archlinux.org/viewtopic.php?id=45256
# ttf-openlogos Maintainer: HateJacket <thehatejacket at gmail dot com>
pkgname=ttf-openlogos-archupdate
pkgver=1.0
pkgrel=2
pkgdesc="Font depicting various open-source logos, by CtrlAltF12"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=45256"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-openlogos-archupdate.install
source=('https://github.com/jpope777/PKGBUILDs/raw/master/ttf-openlogos-archupdate/openlogos-archupdate.ttf')
conflicts=('ttf-openlogos')

package() {
	install -Dm0644 openlogos-archupdate.ttf $pkgdir/usr/share/fonts/TTF/openlogos.ttf
}

sha256sums=('9e7e171a01d327df63460eac083ce4e756b52466be87d6670e80dafd7eccf177')
