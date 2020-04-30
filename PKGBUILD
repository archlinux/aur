# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-plugin-contextmenu
pkgver=3.2
pkgrel=1
pkgdesc='Contextmenus for various parts of Roundcube using commands from the toolbars'
arch=('any')
url='https://github.com/JohnDoh/roundcube-contextmenu'
license=('GPL3')
depends=('roundcubemail>=1.4.4')
source=("roundcubemail-plugin-contextmenu-${pkgver}.tar.gz::https://github.com/JohnDoh/roundcube-contextmenu/archive/${pkgver}.tar.gz")
sha256sums=('a057b297f47db8220ca2f141735af3307ba9a2090fd9d2d056fced2588b6f8c8')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/roundcube-contextmenu-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/contextmenu"
}

