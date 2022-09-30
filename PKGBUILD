# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-ublock-origin-bin
pkgver=1.4.4
pkgrel=3
pkgdesc="An efficient blocker - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-ublock-origin-bin-aur"
license=('GPL3')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('24fb905ca9016b90d61d099243f0c865dfc5be33e42f1f1a0568afa368af8c41')
provides=('chromium-extension-ublock-origin')
conflicts=('chromium-extension-ublock-origin')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
