# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-async-javascript
pkgver=2.20.12.09
pkgrel=1
pkgdesc="Increase the performance of your WordPress website"
arch=('any')
url="https://autoptimize.com"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/async-javascript.${pkgver}.zip")
sha512sums=('288668f888cebb1425d828405a56f187138d095711a110bbfa1c4fb9cb7129621d5fd8da397d1f2f3de41476fb3dbef7daadae3c61bc1cb53d7bdd3f62c1a76a')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/async-javascript" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
