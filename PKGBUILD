# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=firefox-extension-uget-integration
pkgname=$_pkgname-bin
pkgver=2.1.3.2resigned1
_number=4272310
pkgrel=1
pkgdesc="Integrate Mozilla Firefox with uGet download manager (binary release)"
url="https://addons.mozilla.org/addon/ugetintegration"
license=('GPL-3.0-only')
arch=('any')
depends=('firefox')
conflicts=("$_pkgname")
provides=("$_pkgname")
groups=('firefox-addons')
noextract=("ugetintegration-${pkgver}.xpi")
source=("https://addons.mozilla.org/firefox/downloads/file/$_number/ugetintegration-${pkgver}.xpi")
sha256sums=('323d69317af8a882560c8eeb131cceb66a68c16f305c057d5755009ee09297e1')

package() {
  install -Dm644 ugetintegration-${pkgver}.xpi "$pkgdir/usr/lib/firefox/browser/extensions/uget-integration@slgobinath.xpi"
}
