# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.5.3
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
b2sums_x86_64=('da0c53c57b65937cedf8c5136ba78d9c074376319a017fc724fdb3ed6112fb970ba80fcf4bfd1cf35d4de0eeb2bc6ad60e55e67b78ea0d5868d6e8c647c39590')
b2sums_aarch64=('eb319dc45540de376aafac8b8d3a9cc510cfff4ba3ace3d3141cfb459a0fa2e44365ac17910f508e00fe8d00c3effaeefda0f29e3ff6aa825e8df4e01fc2ce72')
b2sums_armv7h=('a3198f3d6e9dd0723082ff33842f9d474e2ed04c26c31b1f0efd800273658ee98b63125e6031d4193afd028f94a3731755557a989c60ee527760949afee086d0')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel"
}
