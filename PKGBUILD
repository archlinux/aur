# Maintainer: linuxer <https://linuxer.gr> 
# https://gitlab.com/linuxer.gr
# Contributor: Kostas Gewrgiou <gewrgiou@imbc.gr>
# Contributor: Vasilis Vasaitis <vvas@hal.csd.auth.gr>
# Contributor: Ivan Pascal <pascal@info.tsu.ru>
pkgname=greeklayoutwithdotonnumpad
pkgver=1.2
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
source=('https://gitlab.com/linuxer.gr/greek-layout-dot-instead-of-comma-on-keypad/uploads/f57fde6f22aac3598d1ad4944f1f1559/gr')
sha256sums=('1bfc81a11a054b95cf7bff2227105470aa806f93443182ce7a4accdc9286b9d8')

package() {
#    cd "${pkgname}-${pkgver}"
    cd "${pkgdir}"
	sudo cp ../../gr /usr/share/X11/xkb/symbols/ 
	sudo chmod -R +r /usr/share/X11/xkb/symbols/gr
}

# vim:set ts=4 sw=2 ft=sh et:

