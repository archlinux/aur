# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=packrom
pkgver=1.3
pkgrel=1
pkgdesc='Uzebox(tm) ROM utility'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/Uzebox/uzebox'
depends=()
makedepends=()
source=('git+https://github.com/Uzebox/uzebox.git#commit=7818bc4')
md5sums=('SKIP')

build() {
  cd "${srcdir}/uzebox/tools/packrom/"
  make release
}

package() {
  install -Dvm755 "${srcdir}/uzebox/tools/packrom/packrom" "${pkgdir}/usr/bin/packrom"
}

