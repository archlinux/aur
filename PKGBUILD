# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-gdpr-compliance
pkgver=1.5.6
pkgrel=1
pkgdesc="Assists website and webshop owners with European Privacy Regulations"
arch=('any')
url="https://www.wpgdprc.com"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-gdpr-compliance.${pkgver}.zip")
sha512sums=('2ed6dd6212a0bee421fc7ca29239bb18901bb1c4e8ea551bcf4189647b4e73e8a3cfa52cc1b0a66bc250933ad57556483cdc24b3bebb0126d58f9a14effdc70e')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-gdpr-compliance" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
