# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-rggl-bin
pkgver=6.1.5
pkgrel=3
pkgdesc="Remove German Gender Language - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-rggl-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('023f8b6251514b59a930acdc9aaa40c3624cf2dad1507341d78fa148ffa646ce')
depends=('chromium')
provides=('chromium-extension-rggl')
conflicts=('chromium-extension-rggl')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
