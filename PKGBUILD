# Maintainer:
# Mikel Pintado <mikelaitornube2010@gmail.com>
# Contributors:
# Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=mikelpint-keyring
pkgver=20180320
pkgrel=1
pkgdesc='The mikelpint repository keyring.'
url='http://mikelpint.github.io/packages'
arch=(any)
install=${pkgname}.install

source=(
  mikelpint-keyring.install
  mikelpint.gpg
)

md5sums=(
  db762eea95fc691eb344245bbbbacf38
  3b8981914b20438a773d01175138fc6d
)

package() {
  _d=usr/share/pacman/keyrings
  mkdir -p $pkgdir/$_d
  install -m 644 $srcdir/mikelpint* $pkgdir/$_d
}

