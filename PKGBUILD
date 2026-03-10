# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-461
pkgname=arma3-unix-launcher-bin
pkgver=461.6d9dd42
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt6-base' 'qt6-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('8bfc2e7a99b5535e9f89d3cea883a126209e929c980db97b125347be092fac59')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
