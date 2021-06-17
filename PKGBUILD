# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-webp-converter-for-media
pkgver=3.0.5
pkgrel=1
pkgdesc="Speed up your website by serving WebP images instead of standard formats"
arch=('any')
url="https://wordpress.org/plugins/webp-converter-for-media"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/webp-converter-for-media.zip")
sha512sums=('68e30e63b2835559e5d14a356cbb7c0bfaf01863f7bf97f38e4167f0f59ea3f81a9c2b563d8ddeccdc0df957e806d1fcc3df04efd9497359e5eb2365847319e0')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/webp-converter-for-media" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
