# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-statistics
pkgver=13.0.4
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/wp-statistics/wp-statistics"
license=('GPL3')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-statistics.${pkgver}.zip")
sha512sums=('b7db31dd835dc8c6a401a88b2948920d14764b06a85a693b6564d4604848950b7c98b76feb604a5a9d047de5ed80d68a69abc9f896df329d3252fe04487cbc68')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-statistics" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/wp-statistics/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
