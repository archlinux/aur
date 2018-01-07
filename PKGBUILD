# $Id: PKGBUILD 127137 2015-02-04 23:02:34Z bluewind $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Roberto Carvajal <roberto@archlinux.org>

pkgname=mp32ogg
pkgver=0.11
pkgrel=10
pkgdesc="A perl script to convert MP3 files to Ogg Vorbis files"
arch=('any')
url='http://faceprint.com/code/'
license=('PerlArtistic')
depends=('perl-mp3-info' 'perl-string-shellquote' 'mpg123' 'vorbis-tools')
source=("https://sources.archlinux.org/other/mp32ogg/mp32ogg")
md5sums=('a1cd916c3ad43073519321dcd075f188')

package() {
  install -Dm755 ${srcdir}/mp32ogg "${pkgdir}/usr/bin/mp32ogg"
}
