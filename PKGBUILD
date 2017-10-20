# $Id$
# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname="pbt"
pkgver="1.0.10"
pkgrel=1
pkgdesc='Bullettrain prompt builder written in Python'
url='https://github.com/jtyr/pbt'
arch=('i686' 'x86_64')
license=('MIT')
makedepends=("python-setuptools")
depends=("python")
optdepends=('nerd-fonts-complete')
source=("https://github.com/jtyr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bd1e312b295acdf38fda083a31ee62fc7ba3bcf5e924d0a7fd9d732f48eb688e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
