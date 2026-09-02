# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.7.1
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
b2sums_x86_64=('dd665235377a679275e6fcd5146dc49cf69418b234e004375f0dd3d564214aad9fd8d816bbc9e2a30cefd21e89c668bca77b68755fb59d790383e6fbc737ddea')
b2sums_aarch64=('d7f8c548a3a7469e2acb65f20faf06e083ccb643617d5736596530170356158ade272430233cf3cb42799b4ba64833f915e689f61cd4de89fec8b86286c25681')
b2sums_armv7h=('275f0d6d714e65f2618221c21cb67fecfb6e5b4e368a92a4a4df9434ee3817cfd6223123dff46287a9c20fe678b800e081a97ac8e741ef6fc8e7c211b272e3e9')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel/"
}
