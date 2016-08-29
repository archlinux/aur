# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=gh-ost
pkgver=1.0.14
_pkgver=20160826083132
pkgrel=1
pkgdesc="GitHub's Online Schema Change for MySQL"
arch=('i686' 'x86_64')
url="https://github.com/github/gh-ost"
license=('MIT')
depends=('go')
source=("https://github.com/github/gh-ost/releases/download/v$pkgver/gh-ost-binary-linux-$_pkgver.tar.gz")
sha256sums=('87fb28728958839fdf46dd8646a8358978a35a309c248322dfaaccff8c13dbf2')

package() {
  cd $srcdir
  install -Dm755 gh-ost "$pkgdir"/usr/bin/gh-ost
}
