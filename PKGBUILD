# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-219
pkgname=arma3-unix-launcher-bin
pkgver=219.658faae
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.xz")
sha256sums=('c0d9aa3c342fade9ee9ac364da91e0c6128f1ffbfd71e4ddf35437d5e0b135f0')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
