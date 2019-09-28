# Maintainer: Kevin Kuehler <keur@ocf.berkeley.edu>
# Contributor: Yuan Zhou <jerryzhou@xcf.berkeley.edu>

_pkgname=babble
pkgname=firefox-$_pkgname
pkgver=0.1.0
pkgrel=1
pkgdesc='A platform agnostic browser extension that allows for easy encryption and decryption of text data across the web.'
arch=('any')
url="https://github.com/XCF-Babble/$_pkgname"
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/2599716/$_pkgname-$pkgver-fx.xpi")
noextract=('${source##*/}')
sha512sums=('e1906b46b03cd4e611dfb9152bf102eb34f5a52c4ec57d9312c5d9900a7b051d58dd50eb63ea17562e0f12f6f7492c0a2f6c9932db10fe7555d04bdecd1bcc39')

package() {
  install -Dm644 "${source##*/}" "$pkgdir/usr/lib/firefox/browser/extensions/{f45cc0a0-da01-dfc1-49f9-f68316927e2d}.xpi"
}
