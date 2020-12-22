# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=systemd-lock-handler
pkgver=1.1.0
pkgrel=1
pkgdesc="Logind lock event to systemd target translation."
arch=('any')
url="https://gitlab.com/WhyNotHugo/systemd-lock-handler"
license=('ISC')
depends=('python-txdbus')
source=("https://gitlab.com/WhyNotHugo/systemd-lock-handler/-/archive/v1.1.0/${pkgname}-v${pkgver}.tar.gz")
md5sums=('a9b1d88f1a0346c3058d81ba26607a1d')

package() {
  cd $srcdir/$pkgname

  make DESTDIR="$pkgdir/" install
}
