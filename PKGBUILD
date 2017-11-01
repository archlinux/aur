# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=pkg2zip
pkgver=1.6
pkgrel=1
pkgdesc='Decrypts PlayStation Vita pkg file and packages to zip archive'
url='https://github.com/mmozeiko/pkg2zip'
arch=('i686' 'x86_64')
license=('custom:unlicense')
source=("https://github.com/mmozeiko/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3243513ddd96a1086fabcf7e347a3ee8f1014a0963262a68616dd48cc0a69065')

package() {

  cd "${srcdir}"/"${pkgname}-${pkgver}"
  make

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm755 pkg2zip "${pkgdir}"/usr/bin/pkg2zip
}
