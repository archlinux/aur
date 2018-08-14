# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>
# Former Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-umatrix
pkgver=1.3.12
pkgrel=2
pkgdesc='Point & click to forbid/allow any class of requests made by your browser. Use it to block scripts, iframes, ads, facebook, etc.'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/1017708/umatrix-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('4ab1d1dc04b030e0515750be7788a724f1b506636f32ea0a59bb6cb9729918d0')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
