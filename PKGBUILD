# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-lightbox-photoswipe
pkgver=3.2.1
pkgrel=1
pkgdesc="Simple integration of PhotoSwipe to WordPress"
arch=('any')
url="https://github.com/arnowelzel/lightbox-photoswipe"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/lightbox-photoswipe.${pkgver}.zip")
sha512sums=('8c4ab7fc21eea89fa78844239776a749590e36b1cdb6a81770c0b793f7f5d9c7a237e271fcc7ace8a7ac3076c3bbd576db130971b1e985e1590321a8650b83dd')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/lightbox-photoswipe" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/lightbox-photoswipe/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
