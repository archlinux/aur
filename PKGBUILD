# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=9.2.3
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
b2sums_x86_64=('62cd8096088cabac93774523948391333d5fcdcfa10935e35147ec24ed7e0dfff4cfa2a7cf3a00cc2f48ac74f85520109026caa26016c9e4276f992d481fecaa')
b2sums_aarch64=('2ac6979eb507fa5dc6d8833330c892a30f405609998e56e08b69c543018d16f4e3389e41044c848248f37ebd76e6f37e0b219f216cb59c05700b6cb1e1ed8f48')
b2sums_armv7h=('558aa8356cbfa2a9cd376c3d197bfaa63acf2f7c50a7caf592bc2a40f542e38ebc3b530d866cec44692f541d816ae7a1fdfa97a3bd7da3e8a287fe82b347de0e')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
