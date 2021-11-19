# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-309
pkgname=arma3-unix-launcher-bin
pkgver=309.571e6f6
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('0a4c1bacd354290a4ae8acd030ef724d1b2656a5d0b4b02a121e9c0cdd53c0db')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
