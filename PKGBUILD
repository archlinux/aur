# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-plugin-contextmenu
pkgver=3.3
pkgrel=1
pkgdesc='Contextmenus for various parts of Roundcube using commands from the toolbars'
arch=('any')
url='https://github.com/JohnDoh/roundcube-contextmenu'
license=('GPL3')
depends=('roundcubemail')
source=("roundcubemail-plugin-contextmenu-${pkgver}.tar.gz::https://github.com/JohnDoh/roundcube-contextmenu/archive/${pkgver}.tar.gz")
sha256sums=('90c00ae78546e757a6ce7d63a27c35bc82d0acdfd9cfffabd02a8a954ac8e085')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/roundcube-contextmenu-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/contextmenu"
}

