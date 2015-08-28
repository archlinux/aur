# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-mail
pkgver=0.2.0
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
sha512sums=("d464f27ab2a34b5c294c4ce7f04a7b053ea1045c1351fd686d3fe4ecbe883581cf3bcf66e2758804e57502cb0e548808edb5f3fbd3b21bf6b2963d19ca19a284"
	    "78f210d657042a9249e7297d871348d035a03e833dda617d4a04b15fe26782d9876f462a61d28272c2f15f088e750eab3d1d1992606967207f0eb980db70e2fa")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/mail-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/mail"
  #install -Dm0644 $srcdir/autoload.php "${pkgdir}/usr/share/webapps/owncloud/apps/mail/vendor/autoload.php"
}
