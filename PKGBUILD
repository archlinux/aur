# Maintainer: foi <foi@live.ru>

pkgname=go-socks5-server-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="primitive but modern socks5 server with authorization"
arch=('x86_64')
url="https://github.com/foi/go-socks5-server"
license=('GNU General Public License v3.0')
sha256sums=('22726d7a1f1f8a4048af24eb06f5a8212d567379720cd2456109f319e724a16c')
source=("https://github.com/foi/go-socks5-server/releases/download/1.0/go-socks5-server-${pkgver}-${pkgrel}.x86_64.rpm")

package() {
  cp -r etc "$pkgdir/"
  cp -r usr "$pkgdir/"
  cp -r lib "$pkgdir/usr"
}

post_install() {
  systemctl daemon-reload
}
