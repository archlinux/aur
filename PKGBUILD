# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-webp-converter-for-media
pkgver=3.0.6
pkgrel=1
pkgdesc="Speed up your website by serving WebP images instead of standard formats"
arch=('any')
url="https://wordpress.org/plugins/webp-converter-for-media"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/webp-converter-for-media.zip")
sha512sums=('f2e73191b11aa94e3f78a2c1840da43c506832912dc5a557787aa7cc438cfd667b7c7575d4b9baaa2a2a8dd9499cd78436f3336a9f8a400016b2bc08bb76b84f')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/webp-converter-for-media" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
