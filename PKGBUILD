# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-browserpass
pkgver=2.0.21
pkgrel=0
pkgdesc="A Firefox extension to retrieve login details from zx2c4 pass"
url=https://github.com/browserpass/browserpass
arch=("any")
depends=(browserpass pass)
license=("MIT")
source=("https://addons.cdn.mozilla.net/user-media/addons/858966/browserpass_ce-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=("1d23a7b2bd8b5fc8570acba72c6b61f1c5a2e602528669b878e714795c2e91af")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/browserpass@maximbaz.com.xpi
}

# vim:set ts=2 sw=2 et:
