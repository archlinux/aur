# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-370
pkgname=arma3-unix-launcher-bin
pkgver=373.cbdc17a
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('387efe3f5cab7fa56fa2a1b32c1fa16a155d06fbc1b96b4ee0d03c42a414fa9b')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
