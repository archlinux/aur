# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.6.2
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
b2sums_x86_64=('66a474a38808f6b6149d82b270baae51a32577497c2347dc32459d4c8613c1c6c1f2b5183d405c0de5c9a9108b02df3c63ec5858d7fa380a0e57a362af745974')
b2sums_aarch64=('1c25e870fe95a6bb4b593fa1a75e3704ddb9f1016952ee235b94cf51c021fd9203dc950d88c8dcee01664a47cf2549c8d45efd4781a94479b22c844a885fc606')
b2sums_armv7h=('0de88608daa0a9ae1ec49a8d0feaf73e15a05003ec6ddc9120f9649b0c02fd3c333446db63464907c5ae4d54e77c3d951e1e5608c5d13c9f3e6598e2507b1980')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel/"
}
