# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rip
pkgver=1.07
pkgrel=3
pkgdesc="A command-line based audio CD track ripper and MP3, FLAC, or Ogg Vorbis encoder"
arch=('any')
url="http://rip.sourceforge.net/"
license=('GPL')
depends=('perl' 'cddb_get' 'perl-mp3-info')
optdepends=('cdparanoia' 'cdda2wav' 'bladeenc' 'gogo' 'lame' 'oggenc' 'flac' 'notlame')
source=(http://$pkgname.sourceforge.net/download/$pkgname-$pkgver.tar.gz)
md5sums=('dd8c967220c854163279881b020dde69')

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
