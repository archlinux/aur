# Maintainer: Harley Wiltzer <harleyw@hotmail.com>
pkgname='python-hydra'
pkgver='1.0.0rc1'
pkgrel=1
epoch=
pkgdesc='A framework for elegantly configuring complex applications'
arch=('any')
url='https://hydra.cc'
license=('MIT')
depends=('python-omegaconf>=2.0')
provides=('python-hydra')
source=("$pkgname-$pkgver::https://github.com/facebookresearch/hydra/archive/hydra-1.0.0rc1.tar.gz")
md5sums=('8507d98157ea0829e7ba0f7a07ea1a57')

package() {
  cd "hydra-hydra-$pkgver"
  python setup.py install --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
