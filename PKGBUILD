# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-453
pkgname=arma3-unix-launcher-bin
pkgver=453.ec12e5b
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('e63aed8ad22149090a6eff10ae251ed64172843907d66fe4ead91bbf4b788a8d')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
