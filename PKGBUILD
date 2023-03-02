# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

_extension=return-youtube-dislike
pkgname=chromium-extension-$_extension-bin
pkgver=3.0.0.8
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/$_extension-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('193a897c9c7fef28f6cca8eac243e021ff0acd5774a3ecb1fd9931c3ee75a178')
provides=("chromium-extension-$_extension")
conflicts=("chromium-extension-$_extension")

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
