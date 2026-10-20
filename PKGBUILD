# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=11.1.0
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
b2sums_x86_64=('3847fca820838138754e72eaa0c20074fa16c885f0f42675b8401c35a0849f92069d3aa5ee02abd6a3b9087d05c7d8d54bb193003847693e335b48719a3fe511')
b2sums_aarch64=('4cf8884717963b501d70c877b6ef2ed616fab36be200714272b40f93c5be65725172068977c0e2b30928d26bace3de943a64c24f6993e14320f96d8ad820ad2e')
b2sums_armv7h=('8fed19cc51cb25d3b141fe6968bd6b1e00b0ae948cdf8617b98dc13ec945aaa9db8289970bee0bd96ef301f70a75477c00420b16a4a7c7360ace35777f600c1e')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel/"
}
