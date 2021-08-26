# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-gdpr-compliance
pkgver=1.5.9
pkgrel=1
pkgdesc="Assists website and webshop owners with European Privacy Regulations"
arch=('any')
url="https://www.wpgdprc.com"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-gdpr-compliance.${pkgver}.zip")
sha512sums=('746f1b569354a7083b6d9ae4daf3127cc85b4946d98370c82911436de82b6a4a9b325e7b9e2a1cae4199f95501dcb169740f98f0520162501dc78989cd89fc4d')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-gdpr-compliance" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
