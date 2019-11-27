# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-statistics
pkgver=12.6.11
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/wp-statistics/wp-statistics"
license=('GPL3')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-statistics.${pkgver}.zip")
sha512sums=('edb4ac0e2cfad8b4129c380945640241facbb94e08e0621a82371beb2e8cbe44f2129c5b170f23130d416b5950874c486c78d23b7bbf3254a19f2fbf86e0bb1d')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-statistics" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/wp-statistics/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
