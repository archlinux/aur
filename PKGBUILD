# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-plugin-contextmenu
pkgver=2.3
pkgrel=2
pkgdesc='Contextmenus for various parts of Roundcube using commands from the toolbars'
arch=('any')
url='https://github.com/JohnDoh/roundcube-contextmenu'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/JohnDoh/roundcube-contextmenu/archive/${pkgver}.tar.gz")
sha256sums=('2e42440d4ea00e3d4b2102bd31e167d9b44d4661533bc6628cd6511f04b268e5')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/roundcube-contextmenu-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/contextmenu"
}

