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
sha256sums=('34f5732097648fcc4a59b88fe99676b28a04cf5602fe7d7392870be8baa17af6')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
