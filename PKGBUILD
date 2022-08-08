# Maintainer: Bogomil Vasilev <smirky@smirky.net>

pkgname=roundcubemail-plugin-persistent_login
pkgver=5.3.0
pkgrel=1
pkgdesc='Roundcube plugin that provides a "Keep me logged in" aka "Remember Me" functionality.'
arch=('any')
url='https://plugins.roundcube.net/#/packages/mfreiholz/persistent_login'
license=('GPL3')
depends=('roundcubemail')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/mfreiholz/persistent_login/archive/refs/tags/version-${pkgver}.tar.gz")
sha256sums=('0f5ee3eb62a631eaf5f838d7eaff94066312522ff3da8d8273ff1c42c5ff3dec')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/persistent_login-version-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/persistent_login"
}
