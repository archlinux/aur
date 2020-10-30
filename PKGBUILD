# Maintainer: Yi Kuo <kuokuoyiyi [at] gmail [dot] com>
pkgname=nv-card-pm
pkgver=0.2
pkgrel=1
pkgdesc="A script to switch NVIDIA graphics card using kernel PM feature"
arch=("x86_64")
url="https://github.com/YiPrograms/NV-Card/tree/nv-card-pm"
license=('GPL')
depends=('nvidia')
conflicts=('nv-card')
optdepends=('bumblebee: optirun support'
            'xf86-video-intel: External display support')
source=(https://github.com/YiPrograms/NV-Card/archive/$pkgver.tar.gz)
md5sums=('SKIP') #autofill using updpkgsums

package() {
  cd "NV-Card-$pkgver"
  install -Dm 755 card "$pkgdir/usr/bin/card"
}
