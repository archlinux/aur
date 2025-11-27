# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.5.1
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
url="https://github.com/erebe/wstunnel"
license=("BSD-3-Clause")
arch=("x86_64" "aarch64" "armv7h")
provides=("wstunnel")
conflicts=("wstunnel" "haskell-wstunnel-bin" "nodejs-wstunnel")
source_x86_64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('f237137e314ae1520e50a68dca95986847d7e8a121861d94f4e28e12ee3f7238fa0ee22e504a9e0b5da5a90452af4adface29b5b217e48480e788df0c9424dec')
b2sums_aarch64=('bbd91c57d88a7dea1891ff451d25d00001580106638cb5310daf4d4bd64e3d0c983061924d73f047f868d429192f0d4fd20dceaeb86457a886e4dc34315c26e0')
b2sums_armv7h=('3ad445c71f2e37ab55ee7a7a882328101f1c0e60c1f9f7405353c52cdd882c1935ec66cafb0f3efdd1f664557b4ac9bba85768105f6e68a3484c684776dc4d3e')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
