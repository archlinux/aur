# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-rggl-bin
pkgver=6.1.4
pkgrel=1
pkgdesc="Remove German Gender Language - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-rggl-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('df6d3b5f127457bcb31ba28b122d0a757a489dd39fc574332d33ae0e08839cc2')
provides=('chromium-extension-rggl')
conflicts=('chromium-extension-rggl')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
