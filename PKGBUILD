# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

pkgbase=python-spark-parser
pkgname=('python-spark-parser')
pkgver=1.8.9
pkgrel=2
pkgdesc="An Early-Algorithm Context-free grammar Parser"
arch=('any')
url="https://github.com/rocky/python-spark/"
license=('MIT')
makedepends=('python-setuptools')
_name='spark_parser'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a7bb97b97953fb8bf0cd8158d820b6467ef1e7f747738e82248ae4c824f1e25a')

package_python-spark-parser() {
    depends=('python-click')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
