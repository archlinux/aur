# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-jetpack
pkgver=7.9
pkgrel=1
pkgdesc="Traffic analysis, security and performance enhancements for Wordpress"
arch=('any')
url="https://wordpress.org/plugins/jetpack"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/jetpack.${pkgver}.zip")
sha512sums=('cba32f0c28809230c6b81667770500334e1db5d25e2e0aaf4799c322b3ade77a91cc84cf8f803b0ba690182966e3f9f3c25a34e72fbad6ef504e55043bc8ca72')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/jetpack" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
