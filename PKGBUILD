# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
# Maintainer: yochananmarqos
pkgname=papirus-folders-gui
pkgver=1.5
pkgrel=1
pkgdesc="A graphical user interface for papirus-folders"
url="https://github.com/ItzSelenux/papirus-folders-gui"
arch=('x86_64')
license=('GPL2')
depends=('papirus-folders' 'qt5-base')
optdepends=('mate-polkit: Polkit Authentication agent, not required on most DE')
source=("https://github.com/ItzSelenux/papirus-folders-gui/releases/download/1.5/papirus-folders-gui" "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('85738b3e6e9b94c9bb51ad9a1ffab4f03cc77125d288cc8d2ff26a9ba01516a8' 'c24246fc1f8af443e9f0e8f3e8138af4ac39caaa62ed05f22438039592ed0c0a') 
package() {
  install -Dm755 "papirus-folders-gui" -t "$pkgdir/usr/bin"
  cd "papirus-folders-gui-1.5"
  install -Dm644 papirus.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
