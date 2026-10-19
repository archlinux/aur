# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: omangold
# Maintainer: Daenyth
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-ogg-vorbis-header'
pkgver='0.12'
pkgrel='1'
pkgdesc="An object-oriented interface to Ogg Vorbis"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-inline>=0.44' 'perl-inline-c>=0')
makedepends=()
url='https://metacpan.org/release/Ogg-Vorbis-Header'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/Ogg-Vorbis-Header-0.12.tar.gz')
md5sums=('dbde251fa80a2dcc8cd728e101c3f642')
sha512sums=('18902bcce3dc03d52e0e4094f76ce2402a2a6fc93689f276202ef81766062ba851c8776102c122d80b76a85e2a32b30c9efa16809fe4a5cd4d02f7b558be0b08')
_distdir="Ogg-Vorbis-Header-0.12"

package() {
  cd $srcdir/$_distdir
  perl Makefile.PL || return 1
  make || return 1
  make test || return 1
  make DESTDIR=$pkgdir install || return 1
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
