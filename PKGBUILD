# Maintainer:
# Mikel Pintado <mikelaitornube2010@gmail.com>
# Contributors:
# Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=mikelpint-keyring
pkgver=20171012
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
  cb208912f9d62448a3001f01afb6f35d
  06e357cc5c57721c4287245ff71e987c
)

package() {
  _d=usr/share/pacman/keyrings
  mkdir -p $pkgdir/$_d
  install -m 644 $srcdir/mikelpint* $pkgdir/$_d
}

