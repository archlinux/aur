# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-221
pkgname=arma3-unix-launcher-bin
pkgver=221.ac42223
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.xz")
sha256sums=('69877c3a4eb189bf791e9b5e92738fdcfdd270eaafd9a3f847c27c6813f4b6fb')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
