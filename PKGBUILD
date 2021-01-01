# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=pyfetch
pkgver=2021.01.01
pkgrel=1
pkgdesc='neofetch rewritten in python'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('gtk3' 'python-gputil')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('09605891b4f50aa9259550180661e4fc9c7469c8397cded010b36c220e53860e')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "usr/bin/$pkgname" -t "$pkgdir/usr/bin"
}
