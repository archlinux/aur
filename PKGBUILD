# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=shn2make
pkgver=2.15
pkgrel=2
pkgdesc="A tool for working with sets of shn and flac audio files"
arch=('any')
url="http://freeengineer.org/shn2make.html"
license=('GPL')
depends=('perl' 'shorten' 'flac' 'lame' 'vorbis-tools' 'cdrtools')
source=(ftp://ftp.freeengineer.org/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3e2f47a48673aea1fe3458547cd52108')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1
  install -Dm644 ${pkgname}rc_proto "${pkgdir}"/usr/share/doc/$pkgname/${pkgname}rc_proto
}
