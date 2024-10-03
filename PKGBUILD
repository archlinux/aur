# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=10.1.1
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
b2sums_x86_64=('81addbcd9ed7fafc0c1897a80ba51b38f867867b69a77509358d42c158c9b13b24f0f01a4534598dc3055a7d28250d44236da905f791e0e06c4a9678aa760cd7')
b2sums_aarch64=('23a47e468e6a17f8f6fc87cb16aad811ea6f1b06815849a34b3e4e777771b28f27c05d10a27f863d95887c2e51fa2b999e203384c9cdd7a036e1582cd98f2461')
b2sums_armv7h=('56ba7d78f7d5448582a170d39209933deeef3d6f048ce7752a7cf03f75102813ee750285dd319f48e6ca9203b788ea288f23180aded16d7ff187e9c07b12a7c1')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
