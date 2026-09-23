# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=11.0.0
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
url="https://github.com/erebe/wstunnel"
license=("BSD-3-Clause")
arch=("x86_64" "aarch64" "armv7h")
provides=("wstunnel")
conflicts=("wstunnel" "nodejs-wstunnel")
source_x86_64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('0dc67fe097beea9ecf56cb43d3b0a51422279a1f0faa412acc786ecd38b1cdb757c511986c6c319f6477df57983427d96ec22fd9c02f66550f18d3d57d936e05')
b2sums_aarch64=('9eb5bc155f98407da0cadce7d878cb11874dec6983f64ab87fa8aa12ca63f6e7e1ae731108dd916a4eb32f7ab2056c697f5ec981dbbb6bae373600f3f66fb229')
b2sums_armv7h=('69d18198be012e01c9ef00647ee2ffcaab0573b477d73ad42f515ec5c63aaefe30afa482462dd2ac81c269908737c97f153a389d3c01ab2c75ab3e0732e7e98b')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel/"
}
