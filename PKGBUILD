# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=9.4.1
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
url="https://github.com/erebe/wstunnel"
license=("custom")
arch=("x86_64" "aarch64" "armv7h")
provides=("wstunnel")
conflicts=("wstunnel" "haskell-wstunnel-bin" "nodejs-wstunnel")
source_x86_64=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('c601a741a837473871a0f6f14b9c634569196e57073f6048b25348237327f1a43212349d5c1f65c1476e0e18c22475c8947dba5f53693b5b22da0439f54829fe')
b2sums_aarch64=('8ed6026c451c7c43ef2cc515aca4da37cf3d7d16946358214cba3d0d4124bcf1d9dd0da95dde9c749d1588b87e1566dfe52162b02cc4d0309c0d319dc64378fa')
b2sums_armv7h=('d716e33d2deb0493d4897f1e199815c1532e5af55a2e545111e7039bbc2792247cf475cc1a95b22378513030dc5c52f131146f817c0ab510cbf58bb2e3ecbc8e')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
