# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Leandro de Assis <leandrodiassis@gmail.com>

pkgname=popstation_md
pkgver=1.0.0
pkgrel=3
pkgdesc="Play PSX Games in Sony PSP, Multiple Disk Games"
arch=('i686' 'x86_64')
url="http://dark-alex.org/"
license=('GPL')
depends=('zlib')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/leandroufcgprojects/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3318c344440b1bcb10403ebf647d6b28df15ae9345b5067b05a62fb97b6d3aaf')
#options=('!buildflags')

build() {
  make
}

package() {
  install popstation_md -Dm755 "${pkgdir}/usr/bin/popstation_md"
}

