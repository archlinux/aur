# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-lightbox-photoswipe
pkgver=3.1.3
pkgrel=1
pkgdesc="Simple integration of PhotoSwipe to WordPress"
arch=('any')
url="https://github.com/arnowelzel/lightbox-photoswipe"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/lightbox-photoswipe.${pkgver}.zip")
sha512sums=('30e38950b8917fed32cbbd3e46c027f08bdfce314499cd7ce7e1e67c27995666f8ad04c0b2b955d95430d097cbe3a5dfdf3da6aaada61d6ec6f29c19c62c4b6a')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/lightbox-photoswipe" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/lightbox-photoswipe/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
