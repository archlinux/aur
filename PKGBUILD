# Maintainer: Bogomil Vasilev <smirky@smirky.net>

pkgname=roundcubemail-plugin-persistent_login
pkgver=1.0.2
pkgrel=2
pkgdesc='Roundcube plugin that provides a "Keep me logged in" aka "Remember Me" functionality.'
arch=('any')
url='https://plugins.roundcube.net/#/packages/texxasrulez/persistent_login'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/texxasrulez/persistent_login/archive/${pkgver}.tar.gz")
sha256sums=('f46ee86543bd15abc1fe0c572d8184ce84c2668d4a63fddb42f7f5701ac72a65')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/persistent_login-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login"
}
