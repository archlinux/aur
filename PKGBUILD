# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-history-disabler-bin
pkgver=2.1.0
pkgrel=2
pkgdesc='disables history by deleting history when responsible tabs are closed - chromium extension (binary version)'
arch=('any')
url="https://github.com/noahvogt/chromium-extension-history-disabler-aur"
license=('APL2')
source=("$url/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-any.pkg.tar.zst")
sha256sums=('a05d12047f1760ab7ce4f90e6e867838aab36e9b9f2e213cf07b7d9a5b1ae794')
provides=('chromium-extension-history-disabler')
conflicts=('chromium-extension-history-disabler')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
