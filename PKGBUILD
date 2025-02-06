# Maintainer: Christos Nouskas <nous artixlinux org>

_author=syohex
pkgname=fu-perl
pkgver=0.01
pkgrel=5
pkgdesc="A simple perl script to query commandlinefu.com"
arch=('any')
url="https://syohex.hatenablog.com/entry/20110123/1295778589"
license=('PerlArtistic')
depends=('perl>=5.10.0' 'perl-json-xs' 'perl-mouse')
options=(!emptydirs)
source=("fu.pl")
sha256sums=('7999a60a979110051fb542ab3934a0f76174add48a0dceb8bfa4b83fec2de51c')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -vm755 fu.pl "$pkgdir/usr/bin/"
  ln -s "/usr/bin/fu.pl" "$pkgdir/usr/bin/fu"
}
