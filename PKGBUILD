# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=pkg2zip
pkgver=1.3
pkgrel=1
pkgdesc='Decrypts PlayStation Vita pkg file and packages to zip archive'
url='https://github.com/mmozeiko/pkg2zip'
arch=('i686' 'x86_64')
license=('custom:unlicense')
source=("https://github.com/mmozeiko/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bb3125f7cc45966d272da2597fb016f14012d63c78c76c12bda7da58999970a0')

package() {

  cd "${srcdir}"/"${pkgname}-${pkgver}"
  make

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm755 pkg2zip "${pkgdir}"/usr/bin/pkg2zip
}
