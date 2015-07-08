# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=kolab
pkgver=3.4
pkgrel=4
pkgdesc='Kolab Groupware solution meta-package'
arch=('any')
license=('AGPL3')
makedepends=()
depends=('chwala>=0.3.0'
         'kolab-freebusy>=1.0.7' 
         'irony>=0.3.0'
         'kolab-syncroton>=2.3.1'
         'kolab-webadmin>=3.2.6'
         'pykolab>=0.7.11-2'
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
sha256sums=('af4a726053cd368ce7c276827bf1f56e71e93377afa0aefc71efe523a7ea78fc')

package() {
    install -Dm755 "${srcdir}/arch-setup-kolab" "${pkgdir}/usr/bin/arch-setup-kolab"
}
