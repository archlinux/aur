# Maintainer: Jenrikku (JkKU)
pkgname=firefox-color
pkgver=2.1.7
pkgrel=1
pkgdesc="Build, save and share beautiful Firefox themes."
url=https://github.com/mozilla/FirefoxColor
arch=('any')
license=('MPL-2.0')
source=("https://addons.mozilla.org/firefox/downloads/file/3643624/firefox_color-$pkgver.xpi")
noextract=("${source##*/}")
sha256sums=('b7fb07b6788f7233dd6223e780e189b4c7b956c25c40493c28d7020493249292')

package() {
    install -Dm644 "${source##*/}" "$pkgdir/usr/lib/firefox/browser/extensions/FirefoxColor@mozilla.com.xpi"
}
