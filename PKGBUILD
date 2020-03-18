# Maintainer: PSposito <http://bit.do/linuxer> 
# https://gitlab.com/psposito
# Contributor: Kostas Gewrgiou <gewrgiou@imbc.gr>
# Contributor: Vasilis Vasaitis <vvas@hal.csd.auth.gr>
# Contributor: Ivan Pascal <pascal@info.tsu.ru>
pkgname=greeklayoutwithdotonnumpad
pkgver=1.1
pkgrel=0
pkgdesc="Greek layout with dot on numpad instead of comma for ARCH Linux"
pkgdir="src/"
instdir="/usr/share/X11/xkb/symbols/"
url="https://gitlab.com/psposito/greek-layout-dot-instead-of-comma-on-keypad/"
license=('GPL3')
replaces=('greeklayoutwithdotonnumpad')
arch=('any')
depends=('xkeyboard-config')
provides=("${pkgname}")
source=("https://gitlab.com/psposito/greek-layout-dot-instead-of-comma-on-keypad/uploads/c98de080d629654b20e5125484174fe4/gr")
sha256sums=('3c39bcd4e6ad45a4c44e2b346f6e8674354b1ad274da860224e3335dd2f935ae')

#build() {
    #cd "~src/"
#    make
#}

package() {
#    cd "${pkgname}-${pkgver}"
    cd "${pkgdir}"
#pwd
	sudo cp ../../gr /usr/share/X11/xkb/symbols/ 
	sudo chmod -R +r /usr/share/X11/xkb/symbols/gr
}

# vim:set ts=4 sw=2 ft=sh et:

