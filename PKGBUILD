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
sha256sums=('1e1705dc33a28a0668f54eae8128f3d7fbe1a78793b1c90a57bf5a1e0498d497')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
