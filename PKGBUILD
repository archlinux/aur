# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-webp-converter-for-media
pkgver=2.4.0
pkgrel=2
pkgdesc="Speed up your website by serving WebP images instead of standard formats"
arch=('any')
url="https://wordpress.org/plugins/webp-converter-for-media"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/webp-converter-for-media.zip")
sha512sums=('b8e8526e54b19b30a059c6a771b91bf94f73715f8ec3897b3eb8abf4a22f3e87c259c4526d62c1bc5249b5a056adb68578ec87a35b1409c8449cd9dfc89a6de9')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/webp-converter-for-media" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
