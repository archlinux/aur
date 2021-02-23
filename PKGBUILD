# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=hatop
pkgver=0.8.0
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
sha512sums=(1776da58a12835434d7b8f59582bad44fb3bf9479f05fedb45f84bc73792b331dda63f989c8b202436801a30600283ec782380e16aa75abf7643ffa5da029718)
