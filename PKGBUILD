# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=10.4.2
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
url="https://github.com/erebe/wstunnel"
license=("BSD 3-Clause")
arch=("x86_64" "aarch64" "armv7h")
provides=("wstunnel")
conflicts=("wstunnel" "haskell-wstunnel-bin" "nodejs-wstunnel")
source_x86_64=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/erebe/wstunnel/releases/download/v$pkgver/wstunnel_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('c21323994520087fe7f55aa98fffeed806ba52e71d40a26a2bf01a12fa96f622032fccfd5269b5057d534057130bde304954c69a2cf3128bed083848b00b1905')
b2sums_aarch64=('5fb0d1f77c392c9e6eec9d2f83836c39c7e801cdc17d549b249fc8039b5a3b6a22a7a9fd48f492a15703c6ef05661b3335da35607c5979a233c0878038c18ab0')
b2sums_armv7h=('f8e7e012c3d37306f4511aa316d5536257d334a1a717208b4544cff691814312fc51b4ee6d30de1b0768c103257a7385712b624cc5f6c947e0b4b04d04f215a6')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
