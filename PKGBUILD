# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-webp-converter-for-media
pkgver=3.0.4
pkgrel=1
pkgdesc="Speed up your website by serving WebP images instead of standard formats"
arch=('any')
url="https://wordpress.org/plugins/webp-converter-for-media"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/webp-converter-for-media.zip")
sha512sums=('34e964b3ad4d9fcccd573b857175d13db1c33352158b2a6e5d77b20a835b7fc6253ad7c0e3be4d8b4e84242488c54ab30307eaacf19616362b65407d6376dedd')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/webp-converter-for-media" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
