# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>

pkgname=krueger
pkgver=0.0.2
pkgrel=1
pkgdesc="it turns off or back on the ability for your machine to sleep"
arch=('any')
url="https://github.com/WebReflection/krueger"
license=('MIT')
depends=('sudo' 'systemd')
source=('freddy.sh' 'LICENSE')
sha256sums=('a4eb32002eb28f6dbed54bed0505ec634fac302348370f5f0ff897ea27c80ef6'
            'e22921705aa49dcd333199f70ef270ae2572a1c83e8704abb202075dfff66929')

package() {
  install -Dm755 freddy.sh "$pkgdir/usr/bin/krueger"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
