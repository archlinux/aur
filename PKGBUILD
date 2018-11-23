# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>
# Former Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-extension-umatrix
pkgver=1.3.14
pkgrel=2
pkgdesc='Point & click to forbid/allow any class of requests made by your browser. Use it to block scripts, iframes, ads, facebook, etc.'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/1057194/umatrix-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('41f5499b2eff5931acc24f2a487daef38034fcfc4099bd2661f7fc1a9bfd105e')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
