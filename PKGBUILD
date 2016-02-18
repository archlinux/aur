# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=roundcubemail-plugins-kolab
pkgver=3.2.10
pkgrel=1
pkgdesc='Kolab Plugins for the Roundcube Webmailer'
arch=('any')
url='http://www.kolab.org'
license=('AGPL3')
depends=('php-ldap' 'roundcubemail' 'php-kolabformat')
optdepends=('roundcubemail-skin-chameleon: Kolab skin for roundcube'
            'pykolab: configuration tool')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('133a0c8fe379c117ea9981dea90c8712d0c7c7c4243f00b40b5992377a504988')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail"
    cp -r "${srcdir}/${pkgname}-${pkgver}/plugins" "${pkgdir}/usr/share/webapps/roundcubemail/"
}

