# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=pkg2zip
pkgver=1.4
pkgrel=1
pkgdesc='Decrypts PlayStation Vita pkg file and packages to zip archive'
url='https://github.com/mmozeiko/pkg2zip'
arch=('i686' 'x86_64')
license=('custom:unlicense')
source=("https://github.com/mmozeiko/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1f625d2c28503b922fd12882d78e531855005bcc9ec353a16a0c49f8d38e6a6b')

package() {

  cd "${srcdir}"/"${pkgname}-${pkgver}"
  make

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm755 pkg2zip "${pkgdir}"/usr/bin/pkg2zip
}
