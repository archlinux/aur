# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=roundcubemail-plugin-contextmenu
pkgver=2.1
pkgrel=1
pkgdesc=('Contextmenus for various parts of Roundcube using commands from the toolbars')
arch=('any')
url='https://github.com/JohnDoh/Roundcube-Plugin-Context-Menu'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/JohnDoh/Roundcube-Plugin-Context-Menu/archive/${pkgver}.tar.gz")
sha256sums=('6ef36e01a34c219a3a5e78e7bc9f5fd89c7a75e69d590b06e7f9e0bf3d4746f5')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/Roundcube-Plugin-Context-Menu-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/contextmenu"
}

