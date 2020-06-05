# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-lightbox-photoswipe
pkgver=3.0.1
pkgrel=1
pkgdesc="Simple integration of PhotoSwipe to WordPress"
arch=('any')
url="https://github.com/arnowelzel/lightbox-photoswipe"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/lightbox-photoswipe.${pkgver}.zip")
sha512sums=('45fe6ee491d6420452d216fd4522d72c07b555eff3da13a5206f50332b7e34e2879e44842eefdef81e7f09fa212a36bd2c305a5f1f5efa2628aacd44bc9ee66b')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/lightbox-photoswipe" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/lightbox-photoswipe/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
