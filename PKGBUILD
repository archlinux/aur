# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>
pkgname=shiori-bin
pkgver=1.5.0
pkgrel=2
pkgdesc="Simple bookmark manager built with Go. Pre-compiled."
arch=('x86_64')
url="https://github.com/RadhiFadlillah/shiori"
license=('MIT')
provides=('shiori')
conflicts=('shiori')
source_x86_64=("https://github.com/RadhiFadlillah/shiori/releases/download/v${pkgver}/${pkgname/-bin}-linux-amd64")
sha1sums_x86_64=('7eb6977d27bf2ff37e64aab7db48f480b0822285')

package(){
  install -Dm755 "${pkgname/-bin}-linux-amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
