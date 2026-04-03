# Maintainer: johnnybash <georg at grgw dot de>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=firefox-extension-keepassxc-browser
pkgver=1.10.1
pkgrel=1
_filename=keepassxc-browser-$pkgver-fx.xpi
pkgdesc="Official browser plugin for the KeePassXC password manager."
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
arch=("any")
license=("GPL-3.0-only")
source=($_filename::"https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_firefox.zip")
noextract=("$_filename")
sha256sums=('7172889b4c1cb7e3eb9e5c9db3f976fa846105b006f4df5f27551e1cc0b4859d')
b2sums=('9a9cda9082898d8e1ae74efc634dd5c32d24084bbca0b7a708b87aeeffe079b0ae370339b2d551ef5a2dae2c54624b0a8f1730c684511f2c3434663d5732cffc')

package() {
    install -Dm644 "$_filename" "$pkgdir"/usr/lib/firefox/browser/extensions/keepassxc-browser@keepassxc.org.xpi
}

# vim:set ts=2 sw=2 et:
