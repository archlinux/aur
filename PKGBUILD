# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-umatrix
pkgver=0.9.3.3
pkgrel=2
pkgdesc='Point and click matrix to filter net requests by source, destination and type'
url=https://github.com/gorhill/uMatrix
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-umatrix')
source=("https://addons.cdn.mozilla.net/user-media/addons/613250/umatrix-$pkgver-sm+fx.xpi")
noextract=("${source##*/}")
sha256sums=('e3f147407433d4809d6636b56366aa6a2c7cac31cec02f81e4f38e7f889e92cd')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/uMatrix@raymondhill.net.xpi
}

# vim:set ts=2 sw=2 et:
