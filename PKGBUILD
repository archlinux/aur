# Maintainer: Marko Korhonen <reekymarko at reekynet.com>
pkgname=shiori-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Simple bookmark manager built with Go. Pre-compiled."
arch=('x86_64')
url="https://github.com/RadhiFadlillah/shiori"
license=('MIT')
provides=('shiori')
conflicts=('shiori')
source_x86_64=("https://github.com/RadhiFadlillah/shiori/releases/download/v${pkgver}/${pkgname/-bin}-linux-amd64")
sha1sums_x86_64=('3a72643b1349624e45be3f1d752313d1fafeceef')

package(){
  install -Dm755 "${pkgname/-bin}-linux-amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
