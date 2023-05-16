# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

_extension=return-youtube-dislike
pkgname=chromium-extension-$_extension-bin
pkgver=3.0.0.9
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/$_extension-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('94c14c1f7007e961434011da240e2151e4639523594133e835668577d573a901')
provides=("chromium-extension-$_extension")
conflicts=("chromium-extension-$_extension")

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
