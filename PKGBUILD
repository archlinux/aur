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
sha256sums=('19d63202c315b383b04a145613ea40759f887221c4e8f4b8fcdbd7536a502368')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
