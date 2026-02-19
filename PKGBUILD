# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-457
pkgname=arma3-unix-launcher-bin
pkgver=457.c21bbb8
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt6-base' 'qt6-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('060b6e5237700fc970d9a8b1f39fcc18d4c5dfa4ee6ee2d5cb27422791ef9dfc')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
