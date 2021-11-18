# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-305
pkgname=arma3-unix-launcher-bin
pkgver=305.b97c56b
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('96c1bb73be64a68f2a2787f6b4db748ab5274f73c7e4e1ce6c1865f9f52668ce')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
