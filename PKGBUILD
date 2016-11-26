# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Leandro de Assis <leandrodiassis@gmail.com>

pkgname=popstation
pkgver=1.0.0
pkgrel=3
pkgdesc="Play PSX Games in Sony PSP, One Disc Games"
arch=('i686' 'x86_64')
url='http://dark-alex.org'
license=('GPL')
depends=('zlib')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/leandroufcgprojects/${pkgname}-${pkgver}.tar.gz")
sha256sums=('47a1c88518377110b006725b29ac6847bb4cfc8d918395235512d4053972e10b')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  install popstation -Dm755 "${pkgdir}/usr/bin/popstation"
}
