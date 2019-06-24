# Maintainer: Yi Kuo <kuokuoyiyi [at] gmail [dot] com>
pkgname=nv-card
pkgver=0.1
pkgrel=1
pkgdesc="A script to switch NVIDIA graphics card using bbswitch"
arch=("x86_64")
url="https://github.com/YiPrograms/NV-Card"
license=('GPL')
depends=('bbswitch' 'nvidia')
optdepends=('bumblebee: optirun support'
            'xf86-video-intel: External display support')
source=(https://github.com/YiPrograms/NV-Card/archive/$pkgver.tar.gz)
md5sums=('SKIP') #autofill using updpkgsums

package() {
  cd "NV-Card-$pkgver"
  install -Dm 755 card "$pkgdir/usr/bin/card"
}