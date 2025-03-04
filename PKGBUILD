# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: johnnybash <georg at grgw dot de>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=librewolf-extension-keepassxc-browser
pkgver=1.9.7
pkgrel=1
_filename=keepassxc-browser-$pkgver-fx.xpi
pkgdesc="Official browser plugin for the KeePassXC password manager."
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
arch=("any")
license=("GPL-3.0-only")
source=($_filename::"https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_firefox.zip")
noextract=("$_filename")
sha256sums=('5aba5a6a987060a77775ce0bf1f047764568f5d5d38900d09d38543f66f829d4')
b2sums=('55831af9c62b10bdf6cf64deb5b491daa4d14c141cf2e01c4bc5d1786eb509840eb31509aa0537d7ca06b3e2b5efea9850a10c2a9732d4290981020c510b7f62')

package() {
    install -Dm644 "$_filename" "$pkgdir"/usr/lib/librewolf/browser/extensions/keepassxc-browser@keepassxc.org.xpi
}

# vim:set ts=2 sw=2 et:

