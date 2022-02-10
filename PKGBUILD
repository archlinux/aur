# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-329
pkgname=arma3-unix-launcher-bin
pkgver=329.3a5122f
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('5e8fb0714906dc08d77d589571da007ec50899766a49d1c387bf8f579d9bb491')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
