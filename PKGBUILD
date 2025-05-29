# Maintainer: weebney <weebney at gmail dot com>
pkgname=webcamize
pkgver=1.2.0
pkgrel=2
pkgdesc="Use any camera as a webcam—DSLR, mirrorless, camcorder, point-and-shoot, and even some smartphones/tablets! "
arch=('any')
url="https://github.com/weebney/webcamize"
license=('BSD-2-Clause')
depends=('ffmpeg' 'gphoto2' 'v4l2loopback-dkms' 'linux-headers')
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "./webcamize" "$pkgdir/usr/bin/webcamize"
}
