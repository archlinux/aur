# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-jetpack
pkgver=8.4.2
pkgrel=1
pkgdesc="Traffic analysis, security and performance enhancements for Wordpress"
arch=('any')
url="https://wordpress.org/plugins/jetpack"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/jetpack.${pkgver}.zip")
sha512sums=('bb5ad857474ab560877fbb58d419260d8b27d45b6a4fddb8d742a9960de24062c831cfa1d185aa53540941e337c1783d9ef309b0be668c26bff3bddc5dbab5fc')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/jetpack" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
