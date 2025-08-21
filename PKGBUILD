# Maintainer: johnnybash <georg at grgw dot de>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=firefox-extension-keepassxc-browser
pkgver=1.9.9.2
pkgrel=1
_filename=keepassxc-browser-$pkgver-fx.xpi
pkgdesc="Official browser plugin for the KeePassXC password manager."
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
arch=("any")
license=("GPL-3.0-only")
source=($_filename::"https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_firefox.zip")
noextract=("$_filename")
sha256sums=('23556b5e7e7b580c590d6df8a97a0db39d8672e8b63bee5d5a550c8abd3dbed4')
b2sums=('39f595c66912d91b05bde62598ba1c7ebf4a2910bbcb1072bfdaa0e8ba60d3ce89459b5429a2f5dea67db51164578303ca7faf0d245edf975ef46388eeb17021')

package() {
    install -Dm644 "$_filename" "$pkgdir"/usr/lib/firefox/browser/extensions/keepassxc-browser@keepassxc.org.xpi
}

# vim:set ts=2 sw=2 et:
