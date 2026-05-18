# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>

pkgname=krueger
pkgver=0.1.1
pkgrel=1
pkgdesc="it turns off or back on the ability for your machine to sleep"
arch=('any')
url="https://github.com/WebReflection/krueger"
license=('MIT')
depends=('sudo' 'systemd')
source=('freddy.sh' 'LICENSE')
sha256sums=('ba14b5349fc54c0da3e276b54ddc30ede62974d097c72beab8998f8f2b4fd201'
            'e22921705aa49dcd333199f70ef270ae2572a1c83e8704abb202075dfff66929')

package() {
  install -Dm755 freddy.sh "$pkgdir/usr/bin/krueger"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
