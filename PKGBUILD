# Maintainer: Kevin Kuehler <keur@ocf.berkeley.edu>
# Contributor: Yuan Zhou <jerryzhou@xcf.berkeley.edu>

_pkgname=babble
pkgname=firefox-$_pkgname
pkgver=0.0.2
pkgrel=1
pkgdesc='A platform agnostic browser extension that allows for easy encryption and decryption of text data across the web.'
arch=('any')
url="https://github.com/XCF-Babble/$_pkgname"
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.mozilla.org/firefox/downloads/file/3404011/$_pkgname-$pkgver-fx.xpi")
noextract=('${source##*/}')
sha512sums=('f8f4739a6d9782b4bf346cb66ad2682f7d6d4ee7e0fc2e7cad06eac5a524bea1bbc02747f2f198c023a68350281e6a7044238eaaae7a29a11b014863bb6a2032')

package() {
  install -Dm644 "${source##*/}" "$pkgdir/usr/lib/firefox/browser/extensions/{f45cc0a0-da01-dfc1-49f9-f68316927e2d}.xpi"
}
