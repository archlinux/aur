# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=irssi-script-sasl
_name=cap_sasl.pl
pkgver=1.11
pkgrel=2
pkgdesc="Freenode SASL support for irssi"
arch=('any')
url="https://freenode.net/sasl/"
license=('GPL')
depends=('irssi')
optdepends=('perl-cryptx: for ECDSA-NIST256p-CHALLENGE')
source=("https://raw.githubusercontent.com/irssi/scripts.irssi.org/gh-pages/scripts/$_name")
md5sums=('fb6f9aaa74661306da7c5304b88dfc1f')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}

# vim:set ts=2 sw=2 et:
