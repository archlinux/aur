# Maintainer: johnnybash <georg at grgw dot de>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=firefox-extension-keepassxc-browser
pkgver=1.9.9.3
pkgrel=1
_filename=keepassxc-browser-$pkgver-fx.xpi
pkgdesc="Official browser plugin for the KeePassXC password manager."
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
arch=("any")
license=("GPL-3.0-only")
source=($_filename::"https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_firefox.zip")
noextract=("$_filename")
sha256sums=('c88ff1feb8aa82fdcee64b3247db9cfa9a5dfea8d273046df6a9c1bd4fa55eb5')
b2sums=('60fcab618f8ea5ad8b9ecb683a9554811543f06d90b7cad32c26f9c81819e2fc52dffe626b7947312917247f7e537f675fd57bf77aaa10b9db168a79ed44e427')

package() {
    install -Dm644 "$_filename" "$pkgdir"/usr/lib/firefox/browser/extensions/keepassxc-browser@keepassxc.org.xpi
}

# vim:set ts=2 sw=2 et:
