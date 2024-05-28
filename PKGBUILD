# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=9.6.1
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
b2sums_x86_64=('af70dbbf16774d8c83053f0aabf1536f784240465bce4c4971a8c41434f3e032015013a789084d17f0835ae6ee7829cb9ab28aad443c39f9b1dea9ccab7a0893')
b2sums_aarch64=('d6202783584d5aa72bc62a68b8f380ab401362baea7e776bde6760b0e0fcac24d691d97ff299439080e708c1bedb33843f0295221deb8d2d66d83085bb22d97c')
b2sums_armv7h=('c4ee57e5633889e9d3164004e81d79c0a8cd9b931b9421f19be39a62381beadd51b3db467e1aa8ca8c4ca39837a10a2d5a33e8b5ac57436fd21240d18dec0a36')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
