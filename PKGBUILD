# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-rggl-bin
pkgver=6.1.5
pkgrel=2
pkgdesc="Remove German Gender Language - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-rggl-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('735e799280d658434fc18af18d901dcc43420544e3d55e16bb85f7847c7bce32')
depends=('chromium')
provides=('chromium-extension-rggl')
conflicts=('chromium-extension-rggl')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
