# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-rggl-bin
pkgver=6.1.3
pkgrel=1
pkgdesc="Remove German Gender Language - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-rggl-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('9b963aab3333606a11ebbad9285c3d9c663b3a847366e58f11ce4a1373b2595b')
provides=('chromium-extension-rggl')
conflicts=('chromium-extension-rggl')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
