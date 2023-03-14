pkgname=retroarch-steam-launcher
pkgver=1.1
pkgrel=1
pkgdesc="A script which adds the Steam version of retroarch to your PATH"
arch=('any')
license=('GPL')
depends=('steam')
provides=('retroarch')
conflicts=('retroarch')
sha256sums=('123bfe782ec97b7e60c4aa69f84b23473ce6d1bc17c3b4a8913982382abb57df')
package() {
    install -Dm755 retroarch "$pkgdir/usr/bin/retroarch"
}
