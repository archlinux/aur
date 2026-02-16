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
sha256sums=('6f8dee4354a47be7e0b65294c3e3634e4e7cb5f2190aab7dced1c62fa75eaaa8')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
