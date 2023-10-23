# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

_extension=return-youtube-dislike
pkgname=chromium-extension-$_extension-bin
pkgver=3.0.0.12
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/$_extension-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('8e1372b4825db85d3a505ec7e9c0238f17773040acb7bf1cd71fc3920fef85fc')
provides=("chromium-extension-$_extension")
conflicts=("chromium-extension-$_extension")

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
