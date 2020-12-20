# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-code-syntax-block
pkgver=2.0.2
pkgrel=1
pkgdesc="Extends Gutenberg adding color syntax highlighting to the code block"
arch=('any')
url="https://github.com/mkaz/code-syntax-block"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/code-syntax-block.${pkgver}.zip")
sha512sums=('5d45c686c03eb8c05589f57793e04d7646e5960475fca18059c1b28e01fe389835fc595eb5e69f5f297a20ebb5d06eec90dfa2dabb935e5e6015b4567ec5662c')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/code-syntax-block" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
