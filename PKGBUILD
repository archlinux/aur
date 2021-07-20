# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-code-syntax-block
pkgver=2.1.0
pkgrel=1
pkgdesc="Extends Gutenberg adding color syntax highlighting to the code block"
arch=('any')
url="https://github.com/mkaz/code-syntax-block"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/code-syntax-block.${pkgver}.zip")
sha512sums=('2e7dc730327bcc94f48dc0fddb6359e7b3244afd9c11ecd2f42fd34f7bed7272fe52ed4890a764e2aca27e826f499a61ffc30af529574dc4cd954e4df3920a76')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/code-syntax-block" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
