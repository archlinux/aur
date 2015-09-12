# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-openid')
_pkgbase='python3-openid'
pkgver=3.0.6
pkgrel=1
pkgdesc="Python3 port of the python-openid library"
arch=(any)
url="https://github.com/necaris/python3-openid"
license=('APACHE')
options=(!emptydirs)
depends=('python-defusedxml')
source=("https://github.com/necaris/python3-openid/archive/v${pkgver}.tar.gz")
sha256sums=('758e67fe097b021ced3148c1b790cfe8437db89c6cc8ade471aaadfcb9d205ab')

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
