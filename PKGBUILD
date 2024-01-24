# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=9.2.1
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
b2sums_x86_64=('bdc3ecfafad4ed5f021d3a1c29b2e5a61a8079c7e756763e20bd3241996943b38e72fb2f0233d67993aa5c81f2339afef7fbdb579aa3b49a03660acbc10f4253')
b2sums_aarch64=('adb112a8754ae648bdb3edeff376681fa9fb9c01188bc6d2c1640c49dfc7b9773e5e6c2fbb3955ce3759d7263f3ed96b645f5be35e0093a612308ec5a5fc643f')
b2sums_armv7h=('ea9a32ff9a34a58e7ccd73d55ca57d932e4591ebd82de7785755f9907921c06b9f1f2efcc8277b56655a67001e744cd4065851f977dd0a3f2140bae22389f9eb')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
