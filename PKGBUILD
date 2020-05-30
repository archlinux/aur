# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-code-syntax-block
pkgver=1.3.2
pkgrel=1
pkgdesc="Extends Gutenberg adding color syntax highlighting to the code block"
arch=('any')
url="https://github.com/mkaz/code-syntax-block"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/code-syntax-block.${pkgver}.zip")
sha512sums=('c7ad001bd95b520b7c86b281c440f6423b9894ecbbda1b31e2583e2dc617c9fff732c794de045df697b664171c8ac924081dcc9594c671df4ee38d5ea7effc30')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/code-syntax-block" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
