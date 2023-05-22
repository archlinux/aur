# Maintainer: salosh <support[at]salosh[dot]org>

_name="parvanka"
pkgbase="$_name"
pkgname=("$pkgbase")
pkgver=0.0.1
pkgrel=1
epoch=1
pkgdesc="Distributed data management"
arch=(any)
url="https://github.com/salosh/parvanka.git"
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
source=("parvanka::git+https://github.com/salosh/parvanka.git")
#source=("${pkgdir}/parvanka")
sha512sums=('SKIP')
b2sums=('SKIP')

build() {
  echo "bin: ${pkgdir}/usr/bin/parvanka"
#  cd ${pkgname}-${pkgver}
#  go build -o parvanka . 
}

package_parvanka() {
#  sitepackages=parvanka
#  mkdir -p $pkgdir/"$sitepackages"
  echo '#!/usr/bin/parvanka' > "${srcdir}/parvanka.sh"
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/parvanka.sh" "${pkgdir}/usr/bin/parvanka.sh"
  chmod +x "${pkgdir}/usr/bin/parvanka.sh"
}
