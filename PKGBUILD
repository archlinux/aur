# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="systemd-lock-handler"
pkgver=0.1.0
pkgrel=1
pkgdesc="Logind lock event to systemd target translation."
arch=('any')
url="https://github.com/hobarrera/systemd-lock-handler"
license=('ISC')
depends=('python2-txdbus')
source=("$pkgname::git+https://github.com/hobarrera/systemd-lock-handler.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
  cd $srcdir/$pkgname

  make DESTDIR="$pkgdir/" install
}
