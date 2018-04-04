# Maintainer: Slithery <aur at slithery dot uk>
pkgname=python-linode-api
pkgver=4.1.8b1
pkgrel=1
pkgdesc="Bindings for the Linode API v4"
arch=('any')
url="https://github.com/linode/$pkgname"
license=('BSD')
depends=('python')
source=("$url/archive/v$pkgver.zip")
sha256sums=('f2e84dac7e89484756a8bb81054efb2cf3bb13362323e367036412adacf09432')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
