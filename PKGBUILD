# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-plugin-contextmenu
pkgver=3.3.1
pkgrel=1
pkgdesc='Contextmenus for various parts of Roundcube using commands from the toolbars'
arch=('any')
url='https://github.com/JohnDoh/roundcube-contextmenu'
license=('GPL3')
depends=('roundcubemail')
source=("roundcubemail-plugin-contextmenu-${pkgver}.tar.gz::https://github.com/JohnDoh/roundcube-contextmenu/archive/${pkgver}.tar.gz")
sha256sums=('63820f7ba116bdf537a51ab53014cc303c45f465e3ff1e310d3333e64940c0bb')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/roundcube-contextmenu-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/contextmenu"
}

