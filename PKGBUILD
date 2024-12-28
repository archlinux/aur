# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=10.1.8
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
b2sums_x86_64=('ff3d8984348350b27dcf6f1356a0c48fbcceb6e625c26196c04c27e22c269da75fd423b33909e6e905bef9f52bd699f5b5741c1a72c66eb6e3d840475c5101c9')
b2sums_aarch64=('e05426dbc68dd33845dc75a9271d28278294b2ad05132f027174d66afe7b61fc6fe1c19523a333ab2c82ce87a13ed6074be111b09de1a3b6db69a9b7c267fd22')
b2sums_armv7h=('a434bb11ede05b026ddeb06c8acfc6e8dc9ed3821a5708d54800bd0760b4afe6d45a0c5d0c7d6f9f1cf46ee018114088e2ad496e9c17ea274fe49023d2983803')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
