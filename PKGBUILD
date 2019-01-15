# Maintainer: Marko Korhonen <reekymarko@reekynet.com>
pkgname=shiori-bin
pkgver=1.0
pkgrel=1
pkgdesc="Simple bookmark manager built with Go. Pre-compiled."
arch=('x86_64')
url="https://github.com/RadhiFadlillah/shiori"
license=('MIT')
provides=('shiori')
conflicts=('shiori')
source_x86_64=("https://github.com/RadhiFadlillah/shiori/releases/download/v${pkgver}/${pkgname/-bin}_linux_amd64")
sha1sums_x86_64=('7a596765765ba21f78e7869687970e73f61d140c')

package(){
  install -Dm755 "${pkgname/-bin}_linux_amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
