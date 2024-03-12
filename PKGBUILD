# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-history-disabler-bin
pkgver=2.1.0
pkgrel=3
pkgdesc='disables history by deleting history when responsible tabs are closed - chromium extension (binary version)'
arch=('any')
url="https://github.com/noahvogt/chromium-extension-history-disabler-aur"
license=('APL2')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('61f52745e3fa1a43533dad2ea4a4c4bc57e76593474b0a00d0b8b9e472fc4afe')
provides=('chromium-extension-history-disabler')
conflicts=('chromium-extension-history-disabler')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
