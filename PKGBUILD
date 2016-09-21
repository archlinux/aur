# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=gh-ost
pkgver=1.0.20
_pkgver=20160913082345
pkgrel=1
pkgdesc="GitHub's Online Schema Change for MySQL"
arch=('i686' 'x86_64')
url="https://github.com/github/gh-ost"
license=('MIT')
depends=('go')
source=("https://github.com/github/gh-ost/releases/download/v$pkgver/gh-ost-binary-linux-$_pkgver.tar.gz")
sha256sums=('1f04095ef47545529e98a93abaf7a7b1e521ce8b78907fdbe068162691213de9')

package() {
  cd $srcdir
  install -Dm755 gh-ost "$pkgdir"/usr/bin/gh-ost
}
