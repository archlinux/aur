# Maintainer: Tomislav Ivek <tomislav dot ivek at gmail dot com>

pkgname=python-patch
pkgver=1.16
pkgrel=3
pkgdesc='Patch utility to apply unified diffs'
arch=('any')
url="https://github.com/techtonik/python-patch/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/da/74/0815f03c82f4dc738e2bfc5f8966f682bebcc809f30c8e306e6cc7156a99/patch-1.16.zip#md5=dbcbbd4e45ddd8baeb02bddf663a3176"
        "https://raw.githubusercontent.com/techtonik/python-patch/2148d5408fafd5c05ac6854dd7deb4e8a4ca4a49/doc/LICENSE")
md5sums=('dbcbbd4e45ddd8baeb02bddf663a3176' 'd3d565685461cd91cd445edf2217ac1b')


package() {
  python setup.py install --optimize=1 --root "$pkgdir"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
