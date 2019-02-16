# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>

pkgname=firefox-color
pkgver=2.1.0
pkgrel=0
pkgdesc="Theming experiment for Firefox Quantum and beyond"
url=https://github.com/mozilla/FirefoxColor
arch=("any")
license=("Mozilla Public License version 2.0")
source=("https://addons.mozilla.org/firefox/downloads/file/1112089/firefox_color-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=("dacba8f16eed45107c45c04bb9067863ac6bd1b3bd1ac9f9cb0c3f5b52119333")

package() {
    install -Dm644 "${source##*/}" "$pkgdir/usr/lib/firefox/browser/extensions/FirefoxColor@mozilla.com.xpi"
}

# vim:set ts=2 sw=2 et:
