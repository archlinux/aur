# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-async-javascript
pkgver=2.21.06.29
pkgrel=1
pkgdesc="Increase the performance of your WordPress website"
arch=('any')
url="https://autoptimize.com"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/async-javascript.${pkgver}.zip")
sha512sums=('a1f8dd1c61efcdf7719217fe5e91abc5d568d1eb033ec64e116b8894f1d6a015c9b1ceaedb852a8b87510ac20eab7026bb57e977c43801288cbe713696846e03')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/async-javascript" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
