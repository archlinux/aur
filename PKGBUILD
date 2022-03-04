# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-337
pkgname=arma3-unix-launcher-bin
pkgver=337.b777241
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('8de15d8847c7820a3eaf471474e91c21b0eefb1a59e3f578f79fa894b6d6b7ee')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
