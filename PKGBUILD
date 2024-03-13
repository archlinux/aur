# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-rggl-bin
pkgver=6.1.5
pkgrel=4
pkgdesc="Remove German Gender Language - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-rggl-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('7c4ecfe3f81ebbae6d99defb92d3d284e88bae2533508c258dd4bcf142a31047')
depends=('chromium')
provides=('chromium-extension-rggl')
conflicts=('chromium-extension-rggl')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
