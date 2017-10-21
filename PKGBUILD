# $Id$
# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='pbt'
pkgver='1.0.11'
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
sha256sums=('10a3c3f9f43634897aaae04fee28cc7644a7ce82c48385461884973b60592bfd')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
