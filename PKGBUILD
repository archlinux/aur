# Maintainer: portaloffreedom

_pkgsrcname=wolframalpha
pkgname=python-wolframalpha
pkgver=3.0.1
pkgrel=1
pkgdesc="Wolfram|Alpha 2.0 API client"
url="https://github.com/jaraco/wolframalpha"
license=("MIT")
arch=("any")
depends=('python' 'python-six' 'python-xmltodict' 'python-jaraco')
source=("https://pypi.python.org/packages/65/6e/1516f03f6fbd9b93f856637394b1e467c0ae07975882425af7b0564c258e/$_pkgsrcname-$pkgver.tar.gz")
md5sums=('74ab78e33fc0affbef9fce2c3d63bac9')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


