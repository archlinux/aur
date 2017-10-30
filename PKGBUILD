# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=pkg2zip
pkgver=1.5
pkgrel=1
pkgdesc='Decrypts PlayStation Vita pkg file and packages to zip archive'
url='https://github.com/mmozeiko/pkg2zip'
arch=('i686' 'x86_64')
license=('custom:unlicense')
source=("https://github.com/mmozeiko/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1e4750c06dc79ddc24e81cbc867eb6eb2ac8258f3b766055ed3dfcb77d200ae1')

package() {

  cd "${srcdir}"/"${pkgname}-${pkgver}"
  make

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm755 pkg2zip "${pkgdir}"/usr/bin/pkg2zip
}
