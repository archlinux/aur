# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="wstunnel-bin"
pkgver=10.5.0
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
b2sums_x86_64=('d73f69a703bb14ccb0ee2447446206305cad170206fc6bd9ae4ba1eb825f38cefb0a6c9ce671c74b26c87fcc46531492e13d7e8473696d522fe998ce847b43fd')
b2sums_aarch64=('ce63825d263662bcfead9243c6573a221d131a6b29ff602b622a119e41c40e9299394421d04b7e6d644cef31e7bbd8911efa4fdba5430b74d75ddeda3b62617b')
b2sums_armv7h=('fe6b72dcb821d46874bbe11c54ba02659e3575ac730a79c3220f5897e82c69de6bb88fdd5d4c7afc4e2532c4155c2d9579e2cc6d9fbc53f00800eb140b592c6a')
options=("!strip")

package(){
 install -D -m 755 "wstunnel"  -t "$pkgdir/usr/bin"
 install -D -m 644 "LICENSE"   -t "$pkgdir/usr/share/licenses/wstunnel"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/wstunnel"
}
