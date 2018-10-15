# Maintainer: Luigi Operoso <brokenpip3[at]gmail[dot]com>

pkgname=apacheconfig
pkgver=0.2.7
pkgrel=1
pkgdesc="Apache and Perl Config::General style configuration file parsing library"
arch=('any')
url="https://github.com/etingof/apacheconfig"
license=('BSD')
depends=('python-ply')
source=("https://pypi.io/packages/source/a/apacheconfig/apacheconfig-$pkgver.tar.gz")
sha256sums=('00e39bd2917248a35614dea0b53ebff3a3b51e81ab741e842582bb85e4bf4685')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
