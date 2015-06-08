# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=saved_password_editor
pkgname=firefox-extension-saved-password-editor
pkgver=2.9
pkgrel=1
pkgdesc="Adds the ability to create and edit entries in the password manager."
url="https://addons.mozilla.org/firefox/addon/saved-password-editor/"
depends=("firefox")
license=('GPLv3')
arch=('any')
source=("https://addons.cdn.mozilla.net/user-media/addons/60265/${_plugin_name}-${pkgver}-sm+tb+fx.xpi")

package() {
  install -D ${srcdir}/*.xpi ${pkgdir}/usr/lib/firefox/browser/extensions/savedpasswordeditor@daniel.dawson.xpi
}

sha256sums=('40d0e4fae8c511dfd08b51102ed384fca0ea5b05ca8f0192b01d30d5122e49b0')
