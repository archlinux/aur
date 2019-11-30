# Maintainer: Abdelhakim Qbaich <abdelhakim@qbaich.com>

pkgname='pash'
pkgver=2.3.0
pkgrel=1
pkgdesc='A simple password manager using GPG written in POSIX sh'
arch=('any')
url="https://github.com/dylanaraps/$pkgname"
license=('MIT')
depends=('gnupg' 'tree' 'xclip')
source=("https://github.com/dylanaraps/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7ee6a649d80350b8b52b1b7ad78d687775a3cc145fecbd3a75d34865c31dd7ef')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
