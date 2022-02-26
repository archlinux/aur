# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>
pkgname=shiori-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Simple bookmark manager built with Go. Pre-compiled."
arch=('x86_64')
url="https://github.com/go-shiori/shiori"
license=('MIT')
provides=('shiori')
conflicts=('shiori')
source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha1sums_x86_64=('c94fdb72ac762b1caec793cb890f2804a24d1ca2')

package(){
  install -Dm755 "${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
