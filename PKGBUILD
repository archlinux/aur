# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-copy-url-on-hover-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Copy URL On Hover - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-copy-url-on-hover-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('4755a856b50906baa1aeac95d03cd72e67806579cdb7308b0936e3d6baab873a')
provides=('chromium-extension-copy-url-on-hover')
conflicts=('chromium-extension-copy-url-on-hover')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
