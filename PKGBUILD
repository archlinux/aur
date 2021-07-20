# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-webp-converter-for-media
pkgver=3.0.7
pkgrel=1
pkgdesc="Speed up your website by serving WebP images instead of standard formats"
arch=('any')
url="https://wordpress.org/plugins/webp-converter-for-media"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/webp-converter-for-media.zip")
sha512sums=('7d36b6bd2d3e10c568f6853a07e763b44b660eb391818b18452f5a54ec144a19e679062a1cae02122081fe35a96aac37a0e1ac48627018bb4f4b236ee69efc48')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/webp-converter-for-media" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
