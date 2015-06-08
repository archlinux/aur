# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=irssi-script-sasl
_name=cap_sasl.pl
pkgver=1.10
pkgrel=1
pkgdesc="Freenode SASL support for irssi"
arch=('any')
url="https://freenode.net/sasl/"
license=('GPL')
depends=('irssi')
optdepends=('perl-cryptx: for ECDSA-NIST256p-CHALLENGE')
source="https://raw.githubusercontent.com/irssi/scripts.irssi.org/gh-pages/scripts/$_name"
md5sums=('a1483240b9e3ca25b93400ab9a4743f3')

package() {
  install -Dm644 "$srcdir/$_name" "$pkgdir/usr/share/irssi/scripts/$_name"
}
