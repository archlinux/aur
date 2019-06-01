# Maintainer: Varshit Bhat <varshitbhat@gmail.com>

pkgname=nmguish-git
pkgver=1.0
pkgrel=1
pkgdesc="nmguish is the GUI Frontend for nmcli ,thus NetworkManager using shellscript (using yad for GUI)"
arch=('any')
url="https://gitlab.com/varshitbhat/nmguish"
license=('GPLv3')
depends=('networkmanager' 'sed' 'yad' 'libnotify' 'nm-connection-editor')
source=(https://gitlab.com/varshitbhat/nmguish/raw/master/nmguish)
noextract=('nmguish')
md5sums=('SKIP')

package() {
	install -Dm755 nmguish "${pkgdir}/usr/bin/nmguish"
	install -Dm644 nmguish.desktop "${pkgdir}/usr/share/applications/nmguish.desktop"
	install -Dm644 nmguish.png "${pkgdir}/usr/share/pixmaps/nmguish.png"
}
