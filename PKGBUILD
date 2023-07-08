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
b2sums=('2a2cb9817f0ef6ce6fda6dd5f3b7e7e271f9b785ee4ba59d420e785968446bef9b0c39588e9a925060b14302c1a8d36d5a0d252dc567e27dbe581155855fedc2')

package() {
  install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
