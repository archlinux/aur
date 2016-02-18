# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-plugin-contextmenu
pkgver=2.1.2
pkgrel=2
pkgdesc='Contextmenus for various parts of Roundcube using commands from the toolbars'
arch=('any')
url='https://github.com/JohnDoh/Roundcube-Plugin-Context-Menu'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/JohnDoh/Roundcube-Plugin-Context-Menu/archive/${pkgver}.tar.gz")
sha256sums=('d38950728dd917d4f8d82656d3564c033a04c416adbe9bf6b352d87d2eab21af')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/Roundcube-Plugin-Context-Menu-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/contextmenu"
}

