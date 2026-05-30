# Maintainer: johnnybash <georg at grgw dot de>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=firefox-extension-keepassxc-browser
pkgver=1.10.2
pkgrel=1
_filename=keepassxc-browser-$pkgver-fx.xpi
pkgdesc="Official browser plugin for the KeePassXC password manager."
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
arch=("any")
license=("GPL-3.0-only")
source=($_filename::"https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_firefox.zip")
noextract=("$_filename")
sha256sums=('ddac1d02b49fc4392f9fed99f72ca086c358f5b3c75799cd4e75c01a56b01741')
b2sums=('1a4fd74581f3b4fa33f7b5acdc6924223c1b7e1e02d2f879d22d1564cb1553e3268865ec7a7acccdf5a0f2aa2ebed91e340e8a6a7f6fe1dea2939a2682cdc9b2')

package() {
    install -Dm644 "$_filename" "$pkgdir"/usr/lib/firefox/browser/extensions/keepassxc-browser@keepassxc.org.xpi
}

# vim:set ts=2 sw=2 et:
