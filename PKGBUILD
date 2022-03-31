# Maintainer: IgnusG <6438760+IgnusG@users.noreply.github.com>

pkgname='trunk-check'
pkgver='0.9.0_beta'
pkgrel=1
url='https://trunk.io/'
arch=('x86_64')
license=('unknown')
install=trunk.install
pkgdesc='Trunk is a blazingly fast meta code checker and formatter'
source=("https://trunk.io/releases/${pkgver//_/-}/trunk-${pkgver//_/-}_linux")
sha512sums=('dd5687d04610e26cdbe8b646c4129905178944148c70aace506c3711882ebd2a2759047f565554758523bd309dd84c225813de73be3bf9ab241ef42e12958540')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m 755 "$srcdir/trunk-${pkgver//_/-}_linux" "$pkgdir/usr/bin/trunk"
}

