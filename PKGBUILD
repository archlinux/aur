# Maintainer: PSposito <http://bit.do/linuxer> 
# https://gitlab.com/psposito/greek-layout-dot-instead-of-comma-on-keypad/
# Contributor: Kostas Gewrgiou <gewrgiou@imbc.gr>
# Contributor: Vasilis Vasaitis <vvas@hal.csd.auth.gr>
# Contributor: Ivan Pascal <pascal@info.tsu.ru>
pkgname=greeklayoutwithdotonnumpad
pkgver=1.1
pkgrel=0
pkgdesc="Greek layout with dot on numpad instead of comma for ARCH Linux"
instdir="/usr/share/X11/xkb/symbols/"
url="https://aur.archlinux.org/packages/greeklayoutwithdotonnumpad/" 
license=('GPL3')
replaces=('greeklayoutwithdotonnumpad')
arch=('any')
depends=('xkeyboard-config')
provides=("${pkgname}")
source=('gr')
sha256sums=('3c39bcd4e6ad45a4c44e2b346f6e8674354b1ad274da860224e3335dd2f935ae')

#build() {
    #cd "~src/"
#    make
#}

package() {
	install -Dm755 ${srcdir}/gr "$instdir/gr"
}


