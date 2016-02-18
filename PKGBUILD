# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=kolab
pkgver=16
pkgrel=1
pkgdesc='Kolab Groupware solution meta-package'
arch=('any')
license=('AGPL3')
makedepends=()
depends=('chwala>=0.3.1'
         'kolab-freebusy>=1.0.8' 
         'irony>=0.3.1'
         'kolab-syncroton>=2.3.2'
         'kolab-webadmin>=3.2.10'
         'pykolab>=0.8.0-3'
         'guam>=0.7.1'
         'cyrus-imapd-ldap>=2.5.7'
         'roundcubemail-plugin-contextmenu>=2.1.2'
         'roundcubemail-plugins-kolab>=3.2.10'
         'roundcubemail-skin-chameleon>=0.3.7'
         'postfix'
         '389-ds-base'
         'mariadb'
         'amavisd-new'
         'perl-ldap'
         'clamav'
         'spamassassin'
         'apache'
         'php-apache')
url='http://kolab.org'
source=('arch-setup-kolab')
sha256sums=('5edfea3a927c811c702d0ed00c7853fc878727043b309976333f1692b0a338e5')

package() {
    install -Dm755 "${srcdir}/arch-setup-kolab" "${pkgdir}/usr/bin/arch-setup-kolab"
}
