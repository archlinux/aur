# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=roundcubemail-plugins-kolab
pkgver=3.2.16
pkgrel=1
pkgdesc='Kolab Plugins for the Roundcube Webmailer'
arch=('any')
url='http://www.kolab.org'
license=('AGPL3')
depends=('php-ldap' 'roundcubemail' 'php-kolabformat')
optdepends=('roundcubemail-skin-chameleon: Kolab skin for roundcube'
            'pykolab: configuration tool')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('89d017bb670f07216fa28ce1d63e2492695e5e24e616c206bad656868ade8627')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail"
    cp -r "${srcdir}/${pkgname}-${pkgver}/plugins" "${pkgdir}/usr/share/webapps/roundcubemail/"
}

