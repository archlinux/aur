# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-code-syntax-block
pkgver=1.0.0
pkgrel=1
pkgdesc="Extends Gutenberg adding color syntax highlighting to the code block"
arch=('any')
url="https://github.com/mkaz/code-syntax-block"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/code-syntax-block.${pkgver}.zip")
sha512sums=("5a07b37668577a4b0af691c0b1ced39039a3ea80b45526dc69472f75b01b758106051af04571cd3dd0161574684956539857a08aa0657514af1ac3fc581d6f8e")

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/code-syntax-block" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
