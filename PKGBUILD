# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-plugin-contextmenu
pkgver=2.3
pkgrel=1
pkgdesc='Contextmenus for various parts of Roundcube using commands from the toolbars'
arch=('any')
url='https://github.com/JohnDoh/Roundcube-Plugin-Context-Menu'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/JohnDoh/Roundcube-Plugin-Context-Menu/archive/${pkgver}.tar.gz")
sha256sums=('63e231607c1cd6e703cf698b263d493d2eb4e10582c7cb47aec3a4fb266acf5b')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/Roundcube-Plugin-Context-Menu-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/contextmenu"
}

