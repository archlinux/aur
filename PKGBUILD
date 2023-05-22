# Maintainer: salosh <support[at]salosh[dot]org>

_name="jockey"
pkgbase="$_name"
pkgname=("$pkgbase")
pkgver=0.0.1
pkgrel=1
epoch=3
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

#source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
#source=("${pkgdir}/jockey")
#sha512sums=('SKIP')
#b2sums=('SKIP')

build() {
  echo "bin: ${pkgdir}/usr/bin/jockey"
#  cd ${pkgname}-${pkgver}
#  go build -o jockey . 
}

package_jockey() {
#  sitepackages=jockey
#  mkdir -p $pkgdir/"$sitepackages"
  echo '#!/usr/bin/jockey' > "${srcdir}/jockey.sh"
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/jockey.sh" "${pkgdir}/usr/bin/jockey.sh"
  chmod +x "${pkgdir}/usr/bin/jockey.sh"
}

