# Maintainer: salosh <support[at]salosh[dot]org>

_name="jockey"
pkgbase="$_name"
pkgname=("$pkgbase")
pkgver=0.0.1
pkgrel=1
epoch=5
pkgdesc="Data J0ckey"
arch=(any)
url="https://github.com/salosh/jockey.git"
license=('MIT')
groups=()
depends=('go')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
md5sums=()
validpgpkeys=()

source=("jockey::git+https://github.com/salosh/jockey.git")
sha512sums=('SKIP')
b2sums=('SKIP')

build() {
  echo "bin: ${pkgdir}/usr/bin/jockey"
}

package_jockey() {
  echo '#!/usr/bin/jockey' > "${srcdir}/jockey.sh"
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/jockey.sh" "${pkgdir}/usr/bin/jockey.sh"
  chmod +x "${pkgdir}/usr/bin/jockey.sh"
}

