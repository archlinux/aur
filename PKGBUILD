# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.6.1
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
b2sums_x86_64=('49297bcf6bc0357c0e8d046434fdc6a599cf242f8f92a5a88eb128cdebfd8f9ca6b127010f3bfe220ad213760360b4bc60215bc36c5d4d56ece1e093605a8b38')
b2sums_aarch64=('eb5037c606b2f3864536f36bc76b3f4fa7ab13db91098a657b48cb3d5665c2c5d919e405df0dd02d88f73689a05eed7007631ce13254324b393554abb261ae8f')
b2sums_armv7h=('6c4ab4dd2a9c8dea365f3ad1ae43574d511c34d627ff5923f4ddbfd2325e08715870b050243a072e9b3a39e4b5931e6cd2a709f14ea91f93c2ee51501245bc59')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel/"
}
