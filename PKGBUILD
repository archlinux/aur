# Maintainer: johnnybash <georg at grgw dot de>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=firefox-extension-keepassxc-browser
pkgver=1.9.2
pkgrel=2
_filename=keepassxc-browser-$pkgver-fx.xpi
pkgdesc="Official browser plugin for the KeePassXC password manager."
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
arch=("any")
license=("GPL-3.0-only")
#source=($_filename::"https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_firefox.zip")
source=($_filename::"https://addons.mozilla.org/firefox/downloads/file/4335111/keepassxc_browser-1.9.2.xpi")
noextract=("$_filename")
sha256sums=('cbc085f0e1275d81af22e12fbc9627381d8eb891998a5ebbf5bc198f8d79a0bf')
b2sums=('68731e07e132cd53083c84b574065a13653b94977281b25ae3f83096bf8b81ab761ae13d561e894e31478b96cc4bd9d521c78aa922f72cd6f238e665c1e69b72')

package() {
    install -Dm644 "$_filename" "$pkgdir"/usr/lib/firefox/browser/extensions/keepassxc-browser@keepassxc.org.xpi
}

# vim:set ts=2 sw=2 et:
