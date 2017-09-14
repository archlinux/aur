# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=firefox-vimium
pkgver=1.59.2
pkgrel=1
pkgdesc='Provides keyboard shortcuts for navigation and control in the spirit of Vim'
url=https://github.com/philc/vimium
arch=('any')
license=('MIT')
source=("https://addons.cdn.mozilla.net/user-media/addons/808538/vimium_ff-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha512sums=('86de79aaf764ef5ea8097b5fa4a4778413b9822524bf3a15ae026e6a51cf271f72bb9b20170c3614d29a38a17a01e9398ee09f9dce99f7344a2a40565cbaad50')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{d7742d87-e61d-4b78-b8a1-b469842139fa}.xpi
}

# vim:set ts=2 sw=2 et:
