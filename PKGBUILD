# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=srt-delay
pkgver=0.0.4
pkgrel=1
pkgdesc="A commandline tool to adjust srt's time stamp."
arch=('any')
url="http://code.google.com/p/trizen/downloads/detail?name=$pkgname-$pkgver.tar.gz"
license=('GPL')
depends=('perl>=5.10.1')
source=("https://raw.githubusercontent.com/trizen/perl-scripts/master/Subtitle/srt-delay")
md5sums=('0db4d334d487101b3674b72a5439b86e')

package() {
  install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
