# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

pkgbase=python-spark-parser
pkgname=python-spark-parser
pkgver=1.9.0
pkgrel=1
pkgdesc="An Early-Algorithm Context-free grammar Parser"
arch=('any')
url="https://github.com/rocky/python-spark/"
license=('MIT')
makedepends=('python-setuptools')
_name='spark_parser'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('dc66d48c4265c4133db41a9c5fe9c1c502b3b20167df158a0f234cd31712cf64')

package_python-spark-parser() {
    depends=('python-click')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
