# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=eclipse-wickedshell
pkgver=2.0.6
pkgrel=1
pkgdesc="a plugin that enables the use of the system shell directly from the eclipse IDE"
url="http://www.wickedshell.net/"
depends=('eclipse')
arch=('any')
source=(http://downloads.sourceforge.net/wickedshell/net.sf.wickedshell.feature_${pkgver}.zip)
license=('EPL')
sha256sums=('536f3dd994b108ae3b0562bdb8e1195713f19e85b152199d2b48bd8948559087')

package() {
    _dest=$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse
    cd $srcdir
    install -d "${_dest}"
    cp -a features "${_dest}"
    cp -a plugins "${_dest}"
}
