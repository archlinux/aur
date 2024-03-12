# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-copy-url-on-hover-bin
pkgver=0.8.0
pkgrel=2
pkgdesc="Copy URL On Hover - chromium extension (binary version)"
arch=('any')
url="https://github.com/noahvogt/chromium-extension-copy-url-on-hover-aur"
license=('custom:none')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('07d99a892338e90f59185ada485118790ad7e1c792df0ad45b25bc6918f69672')
provides=('chromium-extension-copy-url-on-hover')
conflicts=('chromium-extension-copy-url-on-hover')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
