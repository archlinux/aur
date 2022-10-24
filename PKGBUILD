# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=firefox-extension-keepassxc-browser
pkgver=1.8.3
pkgrel=1
_filename=keepassxc-browser-$pkgver-fx.xpi
pkgdesc="Official browser plugin for the KeePassXC password manager."
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
arch=("any")
license=("GPL3")
source=($_filename::"https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_firefox.zip")
noextract=("$_filename")
sha256sums=('5b85a1c3b68e49a819e525e736a4720cc3247a741e2a82519aa87ead28344393')
b2sums=('6468339447a17956836dabb47caaf214b00f2ea02f308326e9b8718070d333e9e50661c0e9a6f3e81d1438d4063a5f547fcbafdd1b3142ee4b1555e90ea4bfd4')

package() {
    install -Dm644 "$_filename" "$pkgdir"/usr/lib/firefox/browser/extensions/keepassxc-browser@keepassxc.org.xpi
}

# vim:set ts=2 sw=2 et:
