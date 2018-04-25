# Maintainer: foi <foi@live.ru>

pkgname=go-socks5-server-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="primitive but modern socks5 server with authorization"
arch=('x86_64')
url="https://github.com/foi/go-socks5-server"
license=('GNU General Public License v3.0')
sha256sums=('3f20dac2180360b6ddbea6903277c876d46c1bacd834c612345093940e0bf395')
source=("https://github.com/foi/go-socks5-server/releases/download/v1.1.0/go-socks5-server-${pkgver}-${pkgrel}.x86_64.rpm")

package() {
  cp -r etc "$pkgdir/"
  cp -r usr "$pkgdir/"
  cp -r lib "$pkgdir/usr"
}

post_install() {
  systemctl daemon-reload
}
