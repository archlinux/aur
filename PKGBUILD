# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-lightbox-photoswipe
pkgver=2.76
pkgrel=1
pkgdesc="Simple integration of PhotoSwipe to WordPress"
arch=('any')
url="https://github.com/arnowelzel/lightbox-photoswipe"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/lightbox-photoswipe.${pkgver}.zip")
sha512sums=('216cec92740f55866496322e026e2602bc64771c37f98986a4ea06bd7223b74743e7e46b5bb9f49709e333c46802291fa05ba52a29388c54dbea39462cf2dd30')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/lightbox-photoswipe" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/lightbox-photoswipe/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
