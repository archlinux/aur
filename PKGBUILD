# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-303
pkgname=arma3-unix-launcher-bin
pkgver=303.86c5998
pkgrel=2
_pkgrel_github=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$_pkgrel_github-archlinux-x86_64.pkg.tar.zst")
sha256sums=('08b63a68c2aac9eddff0f6ad15ee6f9b09fe7bcca5f69fe224e311ba5519bc22')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
