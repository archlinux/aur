# Maintainer Connor Prussin <connor at prussin dot net>
pkgname=minichrome
pkgver=0.0.1
pkgrel=2
pkgdesc="A minimal web browser"
arch=('i686' 'x86_64')
url="https://github.com/cprussin/minichrome"
license=('MIT')
depends=()
source=('https://github.com/cprussin/minichrome/releases/download/v0.0.1/minichrome-0.0.1.tar.gz')
md5sums=('6f227b37d4c9b5df7b5a3d45917b5b4a')

package() {
  mkdir -p "${pkgdir}/usr/lib"
  cp -R "${srcdir}/minichrome-linux-x64" "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/lib/minichrome-linux-x64" "${pkgdir}/usr/lib/minichrome"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${pkgdir}/usr/lib/minichrome/minichrome" "${pkgdir}/usr/bin/minichrome"
}
