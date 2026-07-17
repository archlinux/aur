pkgname=silver-browser-bin
pkgver=1.1
pkgrel=1
pkgdesc="A privacy-focused desktop web browser built on Qt WebEngine/Chromium (Binary Version)"
arch=('x86_64')
url="https://github.com/tudorioan1/silver-browser"
license=('GPL3')
depends=('glibc' 'zlib')
provides=('silver-browser')
conflicts=('silver-browser')
source=("${pkgname}-${pkgver}::https://github.com/tudorioan1/silver-browser/releases/download/browser2/Silver-Browser.v1.1.-.Linux")
md5sums=('SKIP')

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/silver-browser"
}
