# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-simple-login-captcha
pkgver=1.3.2
pkgrel=1
pkgdesc="Simple captcha for the Wordpress login form"
arch=('any')
url="https://wordpress.org/plugins/simple-login-captcha"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/simple-login-captcha.${pkgver}.zip")
sha512sums=('681c3d1d31985413bdb11fb5d71107407e3adc334775e9ffb5d8d16c59beb02b9a7556e3bab3791f4ebdd7dd375e4962deba39c0686857eea4c557617a0c8440')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/simple-login-captcha" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
