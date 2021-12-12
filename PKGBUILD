# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=apacheconfig
pkgver=0.3.2
pkgrel=1
pkgdesc="Apache-style config parser"
arch=('any')
url="https://github.com/etingof/apacheconfig"
license=('BSD')
depends=('python-ply' 'python-six')
source=("https://pypi.io/packages/source/a/apacheconfig/apacheconfig-$pkgver.tar.gz")
sha256sums=('c53204f37bb010cfd88d05d65ef579b4627aa76c8ec6db726243bc63dc90bb70')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
