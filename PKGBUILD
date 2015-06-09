# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=kolab
pkgver=3.4
pkgrel=3
pkgdesc='Kolab Groupware solution meta-package'
arch=('any')
license=('AGPL3')
makedepends=()
depends=('chwala>=0.3.0'
         'kolab-freebusy>=1.0.7' 
         'irony>=0.3.0'
         'kolab-syncroton>=2.3.1'
         'kolab-webadmin>=3.2.6'
         'pykolab>=0.7.10'
         'cyrus-imapd-ldap>=2.5'
         'roundcubemail-plugin-contextmenu>=2.1'
         'roundcubemail-plugins-kolab>=3.2.7'
         'roundcubemail-skin-chameleon>=0.3.5'
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
sha256sums=('0ac0264bfd3afcb1a6ba2619b1bb40d8f54addf9fc49520e003827e23f66565d')

package() {
    install -Dm755 "${srcdir}/arch-setup-kolab" "${pkgdir}/usr/bin/arch-setup-kolab"
}
