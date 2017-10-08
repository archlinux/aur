# Maintainer:
# Mikel Pintado <mikelaitornube2010@gmail.com>
# Contributors:
# Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=mikelpint-keyring
pkgver=20171008
pkgrel=1
pkgdesc='The mikelpint repository keyring.'
url='http://mikelpint.github.io/packages'
arch=(any)
install=${pkgname}.install

source=(
  mikelpint-keyring.install
  mikelpint.gpg
  mikelpint-trusted
)

md5sums=(
  450239f70708ff4036ca6643a212e47a
  d4913de3bde7ab9018bad72ec3c818c6
  dfe31dfaaf218360cbee66d5bf220cd9
)

package() {
  _d=usr/share/pacman/keyrings
  mkdir -p $pkgdir/$_d
  install -m 644 $srcdir/mikelpint* $pkgdir/$_d
}

