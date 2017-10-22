# $Id$
# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='pbt'
pkgver='1.1.0'
pkgrel=1
pkgdesc='Bullettrain prompt builder written in Python'
url='https://github.com/jtyr/pbt'
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('python-setuptools')
depends=("python")
optdepends=('nerd-fonts-complete')
conflicts=('pbt-git')
source=("https://github.com/jtyr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b6f5b7120f42041f25486448fdca74c38a37e71344b1ec088ba4550b1534369b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
