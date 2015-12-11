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
source=("http://leandroufcgprojects.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('ec9fc77413b6d4f29a06d9658035fb7512a12bec')
options=('!buildflags')

build() {
  make
}

package() {
  install popstation_md -Dm755 "${pkgdir}/usr/bin/popstation_md"
}

