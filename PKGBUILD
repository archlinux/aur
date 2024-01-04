# Maintainer: Joel Pickett <mail at vyryls dot com>

_pkgname=librewolf-extension-kagisearch
_id=search@kagi.com
pkgname=$_pkgname-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="A simple helper extension for setting Kagi as a default search engine"
url=https://addons.mozilla.org/en-US/firefox/addon/kagi-search-for-firefox/
arch=('any')
license=('MIT')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("kagi-search-for-firefox-$pkgver.xpi")
_number=4206027
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/kagi-search-for-firefox-$pkgver.xpi")
sha256sums=('7e8366d3f6e9e41028c82bc48a7b479ec5ad1dd18b1fa124bde2f30ce7f5776a')

package() {
  install -Dm644 kagi-search-for-firefox-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/search@kagi.com.xpi"
}
