# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-322
pkgname=arma3-unix-launcher-bin
pkgver=322.9f56619
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('a67c9cca7352403e3d774b7256115aa83be90104aff15f90f31f247a74e55af0')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
