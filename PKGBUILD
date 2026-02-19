# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-455
pkgname=arma3-unix-launcher-bin
pkgver=455.6441a76
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt6-base' 'qt6-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('2d4bf3c044eda55123f4acdc259709f36284797d288a65872534b3ecbcf69b30')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
