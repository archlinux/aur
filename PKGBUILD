# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-mail
pkgver=0.2.1
pkgrel=1
pkgdesc="An email app for ownCloud"
arch=('any')
url="https://github.com/owncloud/mail"
license=('AGPL')
depends=('owncloud')
#	'pear-net-idna2'
#	'php-horde-core'
#	'php-horde-crypt-blowfish'
#	'php-horde-exception'
#	'php-horde-text-filter'
#	'php-horde-text-flowed'
#	'php-horde-idna'
#	'php-horde-imap-client'
#	'php-horde-listheaders'
#	'php-horde-mail'
#	'php-horde-mime'
#	'php-horde-nls'
#	'php-horde-secret'
#	'php-horde-smtp'
#	'php-horde-socket-client'
#	'php-horde-stream'
#	'php-horde-stream-filter'
#	'php-horde-stream-wrapper'
#	'php-horde-support'
#	'php-horde-translation'
#	'php-horde-util'
#	'php-htmlpurifier')
options=('!strip')
source=("https://github.com/owncloud/mail/archive/v${pkgver}.tar.gz"
	"autoload.php")
sha512sums=("38049f3a0b64851849eff54be7ee4eb6e363424495a054b6063f4cf34fa8ea5dda11b341367fe2248e653306ea49df095828d6f90ea7726e752182df6c94edfb"
	    "78f210d657042a9249e7297d871348d035a03e833dda617d4a04b15fe26782d9876f462a61d28272c2f15f088e750eab3d1d1992606967207f0eb980db70e2fa")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/mail-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/mail"
  #install -Dm0644 $srcdir/autoload.php "${pkgdir}/usr/share/webapps/owncloud/apps/mail/vendor/autoload.php"
}
