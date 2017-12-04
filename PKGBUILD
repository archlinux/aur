# Maintainer: Lindenk <ztaticnull@gmail.com>

pkgname=splits
pkgver=0.2.1
pkgrel=1
pkgdesc="A cli tool that splits files into n peices requiring r of them to reconstruct the original"
arch=('any')
url="https://github.com/lindenk/splits"
license=('GPLv3')
depends=('python' 'python-simple-crypt')
source=("https://github.com/Lindenk/$pkgname/archive/$pkgver.tar.gz")
md5sums=('8d224fe858e8e82dd05707d51986302d')


package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 ./splits.py "$pkgdir/usr/bin/$pkgname"
}
