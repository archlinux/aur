# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-simple-login-captcha
pkgver=1.3.3
pkgrel=1
pkgdesc="Simple captcha for the Wordpress login form"
arch=('any')
url="https://wordpress.org/plugins/simple-login-captcha"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/simple-login-captcha.${pkgver}.zip")
sha512sums=('0a6cf1f910c558c8802b6b8f0acf31b028cd25acd66c85b247f738f7fd5f4890ab07821942537214ab6400d1bafea8e22a57648c12105c6f203774f05c22e5c8')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/simple-login-captcha" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
