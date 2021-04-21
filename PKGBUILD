# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
# Maintainer: yochananmarqos
pkgname=papirus-folders-gui-bin
pkgver=1.3
pkgrel=1
pkgdesc="A graphical user interface for papirus-folders, precompiled bin"
url="https://github.com/ItzSelenux/papirus-folders-gui"
arch=('x86_64')
license=('unknown')
depends=('polkit-gnome' 'papirus-folders' 'qt5-base')
provides=('papirus-folders-gui')
conflicts=('papirus-folders-gui')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('356c015b55b0746bbb77841554ab6b5bfca3ea608c0b900c5828bb359a1472b2') 
package() {
  ls
  cd "papirus-folders-gui-1.3/premaked-build"
  install -Dm755 "papirus-folders-gui" -t "$pkgdir/usr/bin"
  install -Dm644 papirus.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
