# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.5.4
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
b2sums_x86_64=('931ce9166334b6b1e7e4341b266a58559c5c20b21d512e39bae72e66bc5f6d56ddd97c9de2babbfa85303263fd5c79e742be8bb76bfa37292511412043f92111')
b2sums_aarch64=('e87979f5708b1e2cdc9c2e0b4b094a32e3b5fa70976b91bca8af65a5f07133acd7964cc86e245c0fb1b72ed8e5ca7c6633826cc546f436c6a5bce61132960899')
b2sums_armv7h=('c620b2fdc574c5acf2c2c2ae2bc108678af32922c26765dae7752dc814c5a70971a00c5150ce4697dfb17a7259641465f8b888f561edf212703491d4e9ae167e')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel"
}
