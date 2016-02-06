# Maintainer: kpj <kpjkpjkpjkpjkpjkpj at gmail dot com>

pkgname='python-maybe'
pkgver=0.2.1
pkgrel=1
pkgdesc='See what a program does before deciding whether you really want it to happen.'
arch=('any')
url='https://github.com/p-e-w/maybe'
license=('GPLv3')
depends=('python-ptrace')
makedepends=('python' 'python-pip')

build() {
  pip install --no-deps --target='maybe' maybe
}

package() {
  mkdir -p $pkgdir/usr/lib/python3.5/site-packages/
  cp -r $srcdir/maybe/* $pkgdir/usr/lib/python3.5/site-packages/
}
