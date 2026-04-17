# Maintainer: veggixmaas
pkgname=vns-manjaro-toolbox
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight PyQt6 maintenance tool for Manjaro Linux"
arch=('any')
url="https://github.com/vnsgzx/vns-manjaro-toolbox"
license=('GPL3')
depends=('python-pyqt6' 'yay' 'xfce4-terminal')
source=("git+$url.git" "vns-manjaro-toolbox.desktop")
md5sums=('SKIP' 'SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 main.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/vns-manjaro-toolbox.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
