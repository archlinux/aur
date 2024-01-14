# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=9.1.0
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
b2sums_x86_64=('7fe512d5ce9f661dc51d02d98a39a330324b12fcfcf6bc7ad035777f9f052428afe48635f31193396c676b645803b9f14884132d770eed3eea49d887a20f02ee')
b2sums_aarch64=('7dee83daf70e976c43760a110287fc0a2c85ad011508f3f54430f17105a19ce1e967baa41df731d85036d6d75ab5864e4c5d0b75c9b2cf5b36586762551daa1b')
b2sums_armv7h=('f10104e96feeac1952bcc38f7fa7935fb83c728f949ee63c281925d37b8ce67a77ae919a94e263d66e3c3ba6f1b7572581d40d9cfbed48c05504fdbf2c789b44')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
