# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=srt-delay
pkgver=0.0.6
pkgrel=1
pkgdesc="A commandline tool to adjust srt's time stamp."
arch=('any')
url="https://github.com/trizen/perl-scripts"
license=('GPL')
depends=('perl>=5.10.1')
source=("https://raw.githubusercontent.com/trizen/perl-scripts/master/Subtitle/srt-delay")
md5sums=('ff37b6803ad128e43b05fc066e8936b3')

package() {
  install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
