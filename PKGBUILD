# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=systemd-lock-handler
pkgver=1.1.0
pkgrel=1
pkgdesc="Logind lock event to systemd target translation."
arch=('any')
url="https://gitlab.com/WhyNotHugo/systemd-lock-handler"
license=('ISC')
depends=('python-txdbus')
source=("https://gitlab.com/WhyNotHugo/systemd-lock-handler/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('3cda34d63b29cbb52442f80c40fa27f7')

package() {
  cd "$srcdir/$pkgname-v$pkgver"

  make DESTDIR="$pkgdir/" install
}
