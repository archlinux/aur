# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-vimium
pkgver=1.59
pkgrel=1
pkgdesc='Provides keyboard shortcuts for navigation and control in the spirit of Vim'
url=https://github.com/philc/vimium
arch=('any')
license=('MIT')
source=("https://addons.cdn.mozilla.net/user-media/addons/808538/vimium-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha512sums=('50f73b6f1289260c1f9d035f2ed80c7ba989f012a87a36bcd94ccebbd2d4cf74ed36a72b52b795a2afe6956ffc1832b0657a5f7c6ba5f39bc0ecc49d54b1851f')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{d7742d87-e61d-4b78-b8a1-b469842139fa}.xpi
}

# vim:set ts=2 sw=2 et:
