# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-279
pkgname=arma3-unix-launcher-bin
pkgver=279.84199f3
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('a4173ae0e83f0595ef1a2c35ad0ad7cb22148361dace61619934ecfed39582cf')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
