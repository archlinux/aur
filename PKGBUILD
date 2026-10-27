# Maintainer: wins1ey <wins1ey at wins1ey dot win>
pkgname=libresplit-bin
_pkgname=libresplit
pkgver=0.3.0
pkgrel=1
pkgdesc="Free speedrun timer with auto splitting and load removal"
arch=('x86_64')
url='https://libresplit.org'
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'jansson'
    'lua54'
)
optdepends=(
    'glib-networking: web split icons'
    'gvfs: web split icons'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!debug' '!strip')
source=("$pkgname-$pkgver.zip::https://github.com/LibreSplit/LibreSplit/releases/download/v$pkgver/LibreSplit-$pkgver-standalone-x86_64.zip")
sha256sums=('01458e735800f3ab40ff75797d25f7edb8b2d464719789b977c4ac670d55f574')

package() {
    cp -a usr "$pkgdir/"
}
