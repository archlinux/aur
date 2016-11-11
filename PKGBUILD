# vim: set ts=4 sw=4 sts=4 et:
# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=git-playback
pkgver=0.1.1rc0
pkgrel=1
pkgdesc="A git command to play back or step through the history of a git-controlled file."
arch=(any)
url="https://github.com/jianli/git-playback"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=()
source=("https://pypi.python.org/packages/f9/30/0b33c4291dc93e174d7f985f613fa15d3f6cd40638f02fc0c63962c3f039/${pkgname}-${pkgver}.tar.gz")
md5sums=('5fe91116cdf7e9588000dc142b35f53d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir"
}
