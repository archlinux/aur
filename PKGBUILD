# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-gdpr-compliance
pkgver=1.5.5
pkgrel=1
pkgdesc="Assists website and webshop owners with European Privacy Regulations"
arch=('any')
url="https://www.wpgdprc.com"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-gdpr-compliance.${pkgver}.zip")
sha512sums=('66fb3f7a48f32fc10c8df13b5dd66d62aa6eea498395b5d0b2a9cacce3cb2af04c8b3f18f71a505e6d354d52ac83518d587d3f415b3d26e8276057435ae82037')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-gdpr-compliance" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
