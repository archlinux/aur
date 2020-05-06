# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-jetpack
pkgver=8.5
pkgrel=1
pkgdesc="Traffic analysis, security and performance enhancements for Wordpress"
arch=('any')
url="https://wordpress.org/plugins/jetpack"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/jetpack.${pkgver}.zip")
sha512sums=('071e859f0a215a0d5f0a2c2ad552ec0df4e2c921ff5f23cc9672010606d667f55320cfa773337e603f7aac59c89fc5c14869ff7f8cffd88cac5186f21935008b')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/jetpack" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
