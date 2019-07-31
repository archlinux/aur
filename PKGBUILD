# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-lightbox-photoswipe
pkgver=2.4
pkgrel=1
pkgdesc="Simple integration of PhotoSwipe to WordPress"
arch=('any')
url="https://github.com/arnowelzel/lightbox-photoswipe"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/lightbox-photoswipe.${pkgver}.zip")
sha512sums=("97521bac9371f7ac26935dec24ab7920f0c300809c7016761336e4d3832efca4165b1c7dc265788706618878d9611de1c6392ea79eb7cc6a46910ac51b54c7cd")

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/lightbox-photoswipe" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/lightbox-photoswipe/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
