# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-plugin-contextmenu
pkgver=3.2.1
pkgrel=1
pkgdesc='Contextmenus for various parts of Roundcube using commands from the toolbars'
arch=('any')
url='https://github.com/JohnDoh/roundcube-contextmenu'
license=('GPL3')
depends=('roundcubemail')
source=("roundcubemail-plugin-contextmenu-${pkgver}.tar.gz::https://github.com/JohnDoh/roundcube-contextmenu/archive/${pkgver}.tar.gz")
sha256sums=('6da73554d26192ee6624bbb14c8e68107b0f511c5efe579e5b22247bde73c141')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/roundcube-contextmenu-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/contextmenu"
}

