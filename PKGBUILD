# Maintainer: Kevin Kuehler <keur@ocf.berkeley.edu>
# Contributor: Yuan Zhou <jerryzhou@xcf.berkeley.edu>

_pkgname=babble
pkgname=firefox-$_pkgname
pkgver=0.2.1
pkgrel=1
pkgdesc='A platform agnostic browser extension that allows for easy encryption and decryption of text data across the web.'
arch=('any')
url="https://github.com/XCF-Babble/$_pkgname"
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.mozilla.org/firefox/downloads/file/3436811/$_pkgname-$pkgver-fx.xpi")
noextract=('${source##*/}')
sha512sums=('19548f74c7b078722f39092db172e8060d550d0952af676e028395372a28a915942a2573bdddf74718740ac2c5cb0bb87c03f0971ed9a14cbfec38f3cf56fba6')

package() {
  install -Dm644 "${source##*/}" "$pkgdir/usr/lib/firefox/browser/extensions/{f45cc0a0-da01-dfc1-49f9-f68316927e2d}.xpi"
}
