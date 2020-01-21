# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Lincoln de Sousa <lincoln@archlinux-br.org>

pkgname=python2-cjson
pkgver=1.2.1
pkgrel=2
arch=('x86_64')
license=('LGPL')
pkgdesc="Fast JSON encoder/decoder for Python"
url="https://pypi.python.org/pypi/python-cjson/"
depends=('python2')
source=("https://pypi.python.org/packages/eb/67/ac7744404acd65c96ae342a6585f8070639c3079766c68da56755fb8f029/python-cjson-$pkgver.tar.gz")
sha256sums=('52db2745264624768bfd9b604acb38f631bde5c2ec9b23861677d747e4558626')

package() {
  cd "$srcdir"/python-cjson-$pkgver
  python2 setup.py install --root="$pkgdir"
}
