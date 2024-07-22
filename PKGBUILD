# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-413
pkgname=arma3-unix-launcher-bin
pkgver=413.2ea62d9
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('85a682ed37be223cd264df9851b344a62f361a84d1a1b5cb89f7a21658791320')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
