# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgname=firefox-extension-keepassxc-browser
pkgver=1.8.8
pkgrel=1
_filename=keepassxc-browser-$pkgver-fx.xpi
pkgdesc="Official browser plugin for the KeePassXC password manager."
url="https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/"
arch=("any")
license=("GPL3")
source=($_filename::"https://github.com/keepassxreboot/keepassxc-browser/releases/download/${pkgver}/keepassxc-browser_${pkgver}_firefox.zip")
noextract=("$_filename")
sha256sums=('a7e8347de3b1e4beeabaf84f1a70cbbcc37c6c888eb1f755d1a5daed66ee1f7c')
b2sums=('663d00daa5e3e18075f916905aa368cf7f429ef90a66cb8ab85258bf98df32d42ff9a6430744141d024185c57e7b3ed4a1f4b9b5b086b7d0218121e4e5656907')

package() {
    install -Dm644 "$_filename" "$pkgdir"/usr/lib/firefox/browser/extensions/keepassxc-browser@keepassxc.org.xpi
}

# vim:set ts=2 sw=2 et:
