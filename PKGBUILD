# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>

pkgname=krueger
pkgver=0.0.1
pkgrel=1
pkgdesc="it turns off or back on the ability for your machine to sleep"
arch=('any')
url="https://github.com/ag/krueger"
license=('MIT')
depends=('sudo' 'systemd')
source=('freddy.sh' 'LICENSE')
sha256sums=('db70442f92e384ec65327cff86ead11385621667f830af3f6e572697fc616486'
            'e22921705aa49dcd333199f70ef270ae2572a1c83e8704abb202075dfff66929')

package() {
  install -Dm755 freddy.sh "$pkgdir/usr/bin/krueger"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
