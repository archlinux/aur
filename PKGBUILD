# Maintainer: Varshit Bhat <varshitbhat@gmail.com>

pkgname=nmguish-git
pkgver=0.9
pkgrel=1
pkgdesc="nmguish is the GUI Frontend for nmcli ,thus NetworkManager using shellscript (using yad for GUI)"
arch=('any')
url="https://gitlab.com/varshitbhat/nmguish"
license=('GPL2')
depends=('networkmanager' 'sed' 'yad' 'libnotify')
source=(https://gitlab.com/varshitbhat/nmguish/raw/master/nmguish)
noextract=('nmguish')
md5sums=('SKIP')

package() {
	install -D -m755 nmguish "${pkgdir}/usr/bin/nmguish"
}
