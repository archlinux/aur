# Maintainer: Alex Aubuchon <alex at alxe.me>

pkgname=yarsync
pkgver=1.0.2
pkgrel=1
pkgdesc="A clean, simple, and swashbuckling tool for synchronizing directories"
arch=('any')
url="https://github.com/A-lxe/$pkgname"
license=('MIT')
depends=('util-linux' 'rsync' 'inotify-tools')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('a92c093991a2ac56dc1602fd928603ad')

package() {
  cd "$pkgname-$pkgver"

  install -D -m755 ./yarsync "$pkgdir/usr/bin/$pkgname"
  install -D -m644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
