# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-code-syntax-block
pkgver=1.3.5
pkgrel=1
pkgdesc="Extends Gutenberg adding color syntax highlighting to the code block"
arch=('any')
url="https://github.com/mkaz/code-syntax-block"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/code-syntax-block.${pkgver}.zip")
sha512sums=('d1046db13dbaa6bd4541c8caadb24070b7b2f866caebcc2b161f7c03dbf0ed6d6295ee5b9df742be0e7eb469d1c557e98e8417fba423d1e4c727491061960269')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/code-syntax-block" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
