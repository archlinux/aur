# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=hatop
pkgver=0.8.1
pkgrel=1
pkgdesc="an interactive ncurses client for the HAProxy unix socket"
arch=('any')
url="https://github.com/jhunt/hatop"
license=('GPL3')
depends=('python')
source=("${url}/archive/v${pkgver}.tar.gz")

build(){
  cd "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 "bin/hatop" "${pkgdir}/usr/bin/hatop"
  install -Dm 644 "man/hatop.1" "${pkgdir}/usr/share/man/man1/hatop.1"
  gzip "${pkgdir}/usr/share/man/man1/hatop.1"
}
sha512sums=(25026ddd62ef43f02cfb3ef41a815adf232c8a4b3053e925dcea69696c207ffbf22966ce1177ef460071e683f5a4ec8d011d2bb2b0aa06f4a9b3e5932aae93b6)
