# Maintainer: Christos Nouskas <nous at archlinux.us>

_author=syohex
pkgname=fu-perl
pkgver=0.01
pkgrel=2
pkgdesc="A simple perl script to query commandlinefu"
arch=('any')
url="http://syohex.hatenablog.com/entry/20110123/1295778589"
license=('PerlArtistic')
depends=('perl>=5.10.0' 'perl-json-xs' 'perl-mouse')
options=(!emptydirs)
source=("fu.pl")
sha256sums=('198788111374a3ecdf5d856c4a0ba358da41ad6a3c3e61ab5af345a7d1851970')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -vm755 fu.pl "$pkgdir/usr/bin/"
  ln -s "/usr/bin/fu.pl" "$pkgdir/usr/bin/fu"
}
