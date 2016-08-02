# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=gh-ost
pkgver=1.0.8
_pkgver=20160801103802
pkgrel=1
pkgdesc="GitHub's Online Schema Change for MySQL"
arch=('i686' 'x86_64')
url="https://github.com/github/gh-ost"
license=('MIT')
depends=('go')
source=("https://github.com/github/gh-ost/releases/download/v$pkgver/gh-ost-binary-linux-$_pkgver.tar.gz")
sha256sums=('0f970d0f000b4c4f0b0c7f6f2c04571204b239906b02ce98b0aadb1c17baa53a')

package() {
  cd $srcdir
  install -Dm755 gh-ost "$pkgdir"/usr/bin/gh-ost
}
