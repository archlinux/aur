# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-gdpr
pkgver=2.2.0
pkgrel=1
pkgdesc="Making your website ready for the GDPR"
arch=('any')
url="https://github.com/WP-GDPR/wp-gdpr-core"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-gdpr-core.${pkgver}.zip")
sha512sums=('3f381aba1a99091b30d96fc828120cefbe03b9251b1d75b078729b06113df93f406e73316bd65d655250aa2f5868f5a49b9d7b16720f7adcbf3791a1cc892b95')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-gdpr-core" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
