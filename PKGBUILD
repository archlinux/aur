# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-breeze
pkgver=1.2.2
pkgrel=1
pkgdesc="Cache plugin with extensive options to speed up your website"
arch=('any')
url="https://wordpress.org/plugins/breeze"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/breeze.${pkgver}.zip")
sha512sums=('2c165d69a965b01797bb7657d4ad40b8e07f54113920ac34f1433d053910ff05e8ba698f0da0f19c2aefd91eb8867eac51c2b62d1d8b54cb1c06955ab03cdfb2')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/breeze" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
