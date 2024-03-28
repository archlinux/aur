# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=9.2.5
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
b2sums_x86_64=('75fde8b1da0be7e5924d0c5c83cc88a88be31a579ca28ab92bcc7820a8c88a91a6eeef19fb5bc1e7b765b51da8cb2bc1ded025b5492b232f72b0fd18ee8ce528')
b2sums_aarch64=('1c98994e5f8f864ebfad9b5e375ea617a1bb710d818084be4fb6f85882be9769b6f06a2930fa3e0d8fe0faa85b2a611c6edbe7c1dcc507723f878800fe3ecbba')
b2sums_armv7h=('1f8b5694e411575b721054211a6fc636fa60c965df03ea56e75dbc27fce8bf1ff6116d78daca4f533d99f0ad2831ce05c1763d80235dbeeb92272a6a81e2fdd0')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
