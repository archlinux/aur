# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=gh-ost
pkgver=1.0.48
_pkgver=20190214020851
pkgrel=1
pkgdesc="GitHub's Online Schema Change for MySQL"
arch=('i686' 'x86_64')
url="https://github.com/github/gh-ost"
license=('MIT')
depends=('go')
source=("https://github.com/github/gh-ost/releases/download/v$pkgver/gh-ost-binary-linux-$_pkgver.tar.gz")
sha256sums=('8d0a518064c5803e1d5e8676031e5a5b5b180e67700d476e19eaf68e4a4a583a')

package() {
  cd $srcdir
  install -Dm755 gh-ost "$pkgdir"/usr/bin/gh-ost
}
