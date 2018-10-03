# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-browserpass
pkgver=2.0.22
pkgrel=0
pkgdesc="A Firefox extension to retrieve login details from zx2c4 pass"
url=https://github.com/browserpass/browserpass
arch=("any")
depends=(browserpass pass)
license=("MIT")
source=("https://addons.cdn.mozilla.net/user-media/addons/858966/browserpass_ce-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=("875957aeda53030bf07a840863d56e6d45eb4901b871ec360fcf05099d031b76")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/browserpass@maximbaz.com.xpi
}

# vim:set ts=2 sw=2 et:
