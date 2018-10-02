# Maintainer Connor Prussin <connor at prussin dot net>
pkgname=minichrome
pkgver=0.0.1
pkgrel=1
pkgdesc="A minimal web browser"
arch=('i686' 'x86_64')
url="https://github.com/cprussin/minichrome"
license=('MIT')
depends=()
source=('https://github.com/cprussin/minichrome/releases/download/v0.0.1/minichrome-0.0.1.tar.gz')
md5sums=('9f8ba27a6d31a686a9abca8a1fbf7dec')

package() {
  mkdir -p "${pkgdir}/usr/lib"
  cp -R "${srcdir}/minichrome-linux-x64" "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/lib/minichrome-linux-x64" "${pkgdir}/usr/lib/minichrome"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${pkgdir}/usr/lib/minichrome/minichrome" "${pkgdir}/usr/bin/minichrome"
}
