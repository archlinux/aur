# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-341
pkgname=arma3-unix-launcher-bin
pkgver=341.164bf27
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('835010b2a014a1b4ba5239afe1e308c6e99e42f9cc1e7346a2ab2bb56635f531')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
