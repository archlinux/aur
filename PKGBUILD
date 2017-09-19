# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=remotemouse
pkgver=1
pkgrel=1
pkgdesc="Turn your mobile phone or tablet into a set of wireless mouse and keyboard."
arch=("any")
url="https://remotemouse.net/"
license=('Unknown')
depends=("libappindicator-sharp")
source=("http://www.remotemouse.net/downloads/RemoteMouse.tar.gz"
        "remotemouse.sh")
md5sums=('d83012ce603322803c7d2e2608f7fe8d'
         '69724b9318bfb1c1c4a06c9d667e1e2b')

package() {
  cd "$srcdir"

  install -Dm 644 RemoteMouse.exe "$pkgdir/opt/remotemouse/RemoteMouse.exe"
  install -Dm 644 rm.svg "$pkgdir/opt/remotemouse/rm.svg"
  install -Dm 755 remotemouse.sh "$pkgdir/usr/bin/remotemouse"
}
