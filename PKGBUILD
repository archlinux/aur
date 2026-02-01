# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.5.2
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
url="https://github.com/erebe/wstunnel"
license=("BSD-3-Clause")
arch=("x86_64" "aarch64" "armv7h")
provides=("wstunnel")
conflicts=("wstunnel" "haskell-wstunnel-bin" "nodejs-wstunnel")
source_x86_64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('14d28ceff9f1b8a901fed0bd6e02ea8b7b24f1ffd620ced02969a7c0cd4a65276776364685182c02d6a88e9494097d4fc477d533a9b9eef5504d73af6755e49a')
b2sums_aarch64=('69a45c0b51fd5dfef4c0bf7a1edefece02939541f0082f5132378bccd257d3685be0ccfd6ec866ca2de8f4d7966bda133aee80cf47a656bc5c9cabc7d26b8c5d')
b2sums_armv7h=('73e0af7c3c0886409a748588ec05e49c316e6a695f0cd8ad9997553caff3b5f595c2d555d0d565a0c9a33506b03cca082cf2d50dd8eca7c06ee6f484b5c19cf8')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
