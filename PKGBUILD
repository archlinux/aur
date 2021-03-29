# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-theme-geist
pkgver=2.0.2
pkgrel=1
pkgdesc="Personal blogging theme for WordPress. Port of Casper 2.0 theme for Ghost"
arch=('any')
url="https://chrisyee.ca/geist/"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/christophery/geist/archive/${pkgver}.tar.gz")
sha512sums=('6aa5e260e5b987d1b5bc71200f9de76cedee4c35b564e071ae497ad9171b0b7ba02711a397772ac683d609af47d25cdc6bf7401bf89ae86528285157a3c1e2ab')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes"
  cp -ra "${srcdir}/geist-${pkgver}" "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes/geist"
  install -D "${srcdir}/geist-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
