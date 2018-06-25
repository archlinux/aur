# Maintainer: Jean Lucas <jean@4ray.co>

# Based on python-torchvision-git by Stephen Zhang

pkgname=python-torchvision
pkgver=0.2.1
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision'
arch=(any)
url=https://pytorch.org
license=(BSD)
depends=(python python-pytorch)
makedepends=(python-setuptools)
source=(https://github.com/pytorch/vision/archive/v$pkgver.zip)
sha512sums=(41fe2ea704cd4d7b43f1043a8666f2d7abd9480519c012321e2f0e3497f2815dc86118c2c57d0cd80f71b6a465521787f4e3c5a423268776009f4069582ab7b4)

package() {
  cd $srcdir/vision-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
